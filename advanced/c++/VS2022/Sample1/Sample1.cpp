#include <iostream>

template<typename ...Args>
void printInfo(Args&&... args) {
	(std::cout << ... << args) << std::endl;
}

template<typename ...Args>
auto getCmd(Args&&... args) {
	char* cmd = new char[256] ();
	(strcat_s(cmd, sizeof(char)*256, args), ...);
	return cmd;
}

struct process {
	const char* name;
	const char* options;
	int returnValue;
	bool captureOutputToLog = false;
	const char* fileOutput;
};

int main(int argc, char* argv[]) {
	if (argc >= 3) {
		char* cmdline;
		const char* password = argv[2];
		process myProcess{ .name = argv[1], .options = password, .captureOutputToLog = true ? argv[1] != nullptr : false, .fileOutput = "out.log"};
		if (myProcess.captureOutputToLog)
			cmdline = getCmd(myProcess.name, " ", myProcess.options, " >> ", myProcess.fileOutput);
		else
			cmdline = getCmd(myProcess.name, myProcess.options);
		myProcess.returnValue = system(cmdline);
		printInfo(myProcess.name, myProcess.options, myProcess.returnValue, myProcess.fileOutput);
		delete[] cmdline;
	}
	else {
		printInfo("help: ", argv[0], " <process name> <passcode>");
		return 1;
	}
	return 0;
}
