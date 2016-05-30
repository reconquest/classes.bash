tests:put foo.class.bash <<CODE
@class Foo
    @method constructor() {
        echo "in constructor [\$@]"
    }
CODE

classes:require foo.class.bash
tests:ensure classes:new "Foo" "var" "super"
tests:assert-no-diff stdout <<DIFF
in constructor [super]
DIFF
