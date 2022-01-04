<?php

namespace App\CustomProjectComponents\Inputs;

use Illuminate\View\Component;

class Custom extends Component
{
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct()
    {
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return <<<HEREDOC
RRRRR
HEREDOC;
    }
}
