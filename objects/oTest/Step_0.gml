if (keyboard_check_pressed(vk_up))
{
    global.hello++;
    hello++;
    if (is_struct(struct)) struct.hello++;
}

if (keyboard_check_pressed(vk_down))
{
    global.hello--;
    hello--;
    if (is_struct(struct)) struct.hello--;
}

if (keyboard_check_pressed(vk_enter))
{
    CrapPointerGetChanged(globalPointer2);
    CrapPointerGetChanged(instancePointer2);
    CrapPointerGetChanged(structPointer2);
}

if (keyboard_check_pressed(vk_backspace))
{
    struct = undefined;
}
