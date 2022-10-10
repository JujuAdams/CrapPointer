/// @param crapPointer

function CrapPointerGetChangedNoUpdate(_crapPointer)
{
    var _scope = _crapPointer[0];
    if (_scope != global)
    {
        if (!weak_ref_alive(_scope)) return false;
        _scope = _scope.ref;
    }
    
    var _newValue = _scope[$ _crapPointer[1]];
    if (is_struct(_newValue) || is_array(_newValue)) _newValue = undefined;
    
    return (_newValue != _crapPointer[2]);
}
