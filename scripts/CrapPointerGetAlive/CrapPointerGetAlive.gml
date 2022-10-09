/// @param crapPointer

function CrapPointerGetAlive(_crapPointer)
{
    var _scope = _crapPointer[0];
    return (_scope == global)? true : weak_ref_alive(_scope);
}
