/// @param crapPointer

function CrapPointerGetAlive(_crapPointer)
{
    var _scope = _crapPointer[0];
    if (_scope == global)
    {
        return variable_global_exists(_crapPointer[1]);
    }
    else
    {
        return (weak_ref_alive(_scope) && variable_struct_exists(_scope, _crapPointer[1]));
    }
}
