/// @param crapPointer

function CrapPointerGet(_crapPointer)
{
    var _scope = _crapPointer[0];
    if (_scope == global)
    {
         return variable_global_get(_crapPointer[1]);
    }
    else
    {
        return weak_ref_alive(_scope)? variable_struct_get(_scope.ref, _crapPointer[1]) : undefined;
    }
}
