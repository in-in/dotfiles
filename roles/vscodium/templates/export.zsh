# default editor
export EDITOR="{{ lookup('pipe', 'which ' ~ user_default_editor ) }} --wait"
