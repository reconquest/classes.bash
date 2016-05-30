
* [classes:new()](#classesnew)
* [classes:require()](#classesrequire)


## classes:new()

Creates instance of specified class.

#### Example

```bash
  classes:new ClassName var 12345
  $var::methodFoo
```

#### See also

* [classes:require](#classes:require)

## classes:require()

Source file with class declaration.

Class should be declared using following syntax:

```bash
   @class ClassName

       @method methodFoo() {
             # here is available two variables
             # $this refers to current instance
             # $identifier string representation of object identifier
             echo "Was created with following identifier: $identifier"
             $this::methodBar arg1
       }

       @method methodBar() {
             echo "There is same identifier: $identifier"
             echo "args: $@"
       }
```

#### Example

```bash
  classes:require foo.class.sh
  classes:new Foo var
  $var::methodFoo
```

