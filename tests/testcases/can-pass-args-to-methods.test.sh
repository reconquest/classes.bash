tests:put foo.class.bash <<CODE
@class Foo
    @method work() {
        echo "work - \$@"
        shift
        \$this::callme \$@
    }

    @method callme() {
        echo "callme - \$@"
    }
CODE

classes:require foo.class.bash
classes:new "Foo" "var" "super"

tests:ensure $var::work a b c
tests:assert-no-diff stdout <<DIFF
work - a b c
callme - b c
DIFF
