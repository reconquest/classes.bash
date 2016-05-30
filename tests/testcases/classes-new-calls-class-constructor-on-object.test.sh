tests:put foo.class.bash <<CODE
@class Foo
    @method construct() {
        echo "in construct [\$@]"
    }
CODE

classes:require foo.class.bash
tests:ensure classes:new "Foo" "var" "super"
tests:assert-no-diff stdout <<DIFF
in construct [super]
DIFF
