/// @param crapPointer

function CrapPointerGetChangedNoUpdate(_crapPointer)
{
    var _scope = _crapPointer[0];
    if (_scope == global)
    {
        return (_scope[$ _crapPointer[1]] != _crapPointer[2]);
    }
    else
    {
        return weak_ref_alive(_scope)? (_scope.ref[$ _crapPointer[1]] != _crapPointer[2]) : false;
    }
}
