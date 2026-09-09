public class NullPointerSample {
	
	private TestClass innerClass;

	public void nullPointer(int id) {
		TestClass t;
		t = null;
		if (id > 0) {
			t = new TestClass(id);
		}
		t.process();
	}

	public static class TestClass {
		private int id;

		public TestClass(int id) {
			this.id = id;
		}

		public void process() {
		}
	}
}
