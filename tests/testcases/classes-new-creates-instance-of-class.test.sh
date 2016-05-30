tests:put foo.class.bash <<CODE
@class Foo
    @method work() {
        echo "inside"
    }
CODE

classes:require foo.class.bash
classes:new "Foo" "var"

tests:ensure $var::work
tests:assert-stdout 'inside'
