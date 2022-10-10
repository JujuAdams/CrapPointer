/// @param crapPointer

function CrapPointerGetChanged(_crapPointer)
{
    var _scope = _crapPointer[0];
    if (_scope != global)
    {
        if (!weak_ref_alive(_scope)) return false;
        _scope = _scope.ref;
    }
    
    var _newValue = _scope[$ _crapPointer[1]];
    if (is_struct(_newValue) || is_array(_newValue)) _newValue = undefined;
    
    var _changed = (_newValue != _crapPointer[2]);
    _crapPointer[@ 2] = _newValue;
    
    return _changed;
}
