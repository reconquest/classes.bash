tests:put foo.class.bash <<CODE
@class Foo
    @method constructor() {
        echo "in constructor with identifier \$identifier"
    }
CODE

classes:require foo.class.bash
tests:ensure classes:new "Foo" "var" "super"
tests:assert-no-diff stdout <<DIFF
in constructor with identifier super
DIFF
