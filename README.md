<h1 align="center">CrapPointer 1.0.1</h1>

<p align="center">Crappy pointers for GameMaker Studio 2022.3 by <b>@jujuadams</b></p>

<p align="center"><a href="https://github.com/JujuAdams/CrapPointer/releases/">Download the .yymps</a></p>

&nbsp;

CrapPointer is a rudimentary implementation of pointer-like behaviour for GameMaker. crapPointers allow you to create a reference to a variable stored in either an instance, struct, or `global` scope, and then get/set that variable later using that reference. I'm told this is sort of the same idea as Rust's box pointers or C++'s smart pointers, but I have no idea if that's accurate or not.

A crapPointer is created using the appropriately named `CrapPointer()` function. It must be given a scope (an instance or a struct or the keyword `global`) and a variable name as a string. A crapPointer cannot be created to a variable that does not yet exist. You can get the value of the variable that the pointer references by using `CrapPointerGet()` and you can set the variable using `CrapPointerSet()`.

**You cannot create pointers to arrays due to limitations with GameMaker's `weak_ref_create()`.** If you need a pointer to an array, wrap it in a struct first.

CrapPointers aren't very fast. I recommend you use local `var` caching of values in order to squeeze extra performance out of crapPointers i.e.

```gml
function MathsIsNotYetRipe(_pointer)
{
    if ((CrapPointerGet(_pointer) mod 2) == 0)
    {
        CrapPointerSet(_pointer, CrapPointerGet(_pointer)/2);
    }
    else
    {
        CrapPointerSet(_pointer, 3*CrapPointerGet(_pointer) + 1);
    }
}
```
is more appropriately written as
```gml
function MathsIsNotYetRipe(_pointer)
{
    var _value = CrapPointerGet(_pointer);
    
    if ((_value mod 2) == 0)
    {
        _value /= 2;
    }
    else
    {
        _value = 3*_value + 1;
    }
    
    CrapPointerSet(_pointer, _value);
}
```

crapPointers are stored using weak references so won't keep references alive. You can check whether a crapPointer references a variable in a struct that's alive by using `CrapPointerGetAlive()`. This function always returns `true` for a pointer that references a variable in `global` scope. If you try to get the value of a variable in a struct that has been garbage collected, `CrapPointerGet()` will return `undefined`.

**If a variable has been removed from a struct, a crapPointer will be treated as unalive and `CrapPointerGet()` will return `undefined` accordingly.**

crapPointers also have an internal "has the value of this variable changed" tracking system, use of which is purely optional. You can check whether the value of a variable has changed by using `CrapPointerGetChanged()`. This function will return `true` if the current value of the variable is different to the cached value stored in the pointer; the cached value inside the pointer is then updated. This means that changes are only detected when `CrapPointerGetChanged()` is called. If a variable changes from e.g. `1` to `2` and back to `1` between calls to `CrapPointerGetChanged()` then no change will be reported.

If you'd like to check if a change has occurred without updating the cached value inside the pointer then please use `CrapPointerGetChangedNoUpdate()`. This is likely to have limited uses (if you need to check for updates at different times then you should make multiple pointers) but it's there if you need it.

**A crapPointer will not track changes made to variables that contain structs or arrays.**

crapPointers themselves are three-element arrays - the weak reference to the scope the variable is held in, the name of the variable, and the cached value of the variable. This means that you cannot create a crapPointer that references a crapPointer. This is for the best. It's a reasonable assertion that using a struct to represent a crapPointer is preferable (with `CrapPointerGet()` being expressed as `crapPointer.Get()` instead) but structs are a few hundred bytes a pop in GameMaker and recent experience on mobile has made me allergic to taking RAM for granted.
