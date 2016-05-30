tests:put foo.class.bash <<CODE
@class Foo
    @method work() {
        echo "work"
        \$this::callme
    }

    @method callme() {
        echo "callme"
    }
CODE

classes:require foo.class.bash
classes:new "Foo" "var"

tests:ensure $var::work
tests:assert-no-diff stdout <<DIFF
work
callme
DIFF
