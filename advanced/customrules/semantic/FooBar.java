import com.foo.*;
import com.bar.*;

public class FooBar {
  public static void main (String [] args) throws Exception {
    Foo f = new Foo();
    f.foo();
    f.myFoo();

    f.noFoo();
    int a = f.noFoo();

    Foo.foo(args[0]);
    Foo.foobar();
    Foo.foo("hello");
    Foo.foo("hi");

    Bar.foo(args[0], args.length);
    Bar.foo_bar();
    Bar.foo("hello.sh");
    Bar.foo("/hello.sh");
    Bar.foo("${ENV_VAR}/hello.sh");

    MyFoo mf = new MyFoo();
    mf.myFoo();
    mf.iFoo();
    mf.getFoo();
  }
}
