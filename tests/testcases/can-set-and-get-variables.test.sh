tests:put foo.class.bash <<CODE
@class Foo
    @method work() {
        @var blah 123
        \$this::callme
        unset blah
    }

    @method callme() {
        @var blah
        echo "callme:\$blah"
    }
CODE

classes:require foo.class.bash
classes:new "Foo" "var"

tests:ensure $var::work a b c
tests:assert-no-diff stdout <<DIFF
callme:123
DIFF
