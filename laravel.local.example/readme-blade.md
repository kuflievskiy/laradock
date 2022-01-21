#### Section creation
    @section('head')
    @endsection

#### Section output place
    @yield('head');

#### Show a default section value in case if section is not defined
    @yield('title', 'Test title - default title');

#### Template inheritance resources/views/layouts/base.blade.php
    @section('head')
    @endsection
    
    @section('top')
    @endsection
    
    @section('nav')
    @endsection
    
    @section('content')
    @show
    
    @section('footer')
    @show

#### Template inheritance resources/views/layouts/home.blade.php
    @extends('layouts.base')
    @section('content')
        @parent
        <h1>{{ title }}</h1>
    @endsection
    
#### Re-defining of the section could be performed in any order in the extending template

#### Convert PHP array into the JS JSON variable.
    <script>
        var myConfig = @json($jsConfig, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
    </script>

#### 
    {{time()}}
    {{phpinfo()}}
    {{-- Commented notes are here --}}
    {{-- @todo: some todo note --}}

#### show without template handle
    @{{time()}}
    
#### show block code without any template handle
    @verbatim
    @endverbatim

#### @if
    @if(isset($var1) && $var1)
    @endif

#### @if() @else @elseif @unless()

#### @isset()

#### auth checks
    @guest
    @endguest
    
    @auth('admin')
    @endauth

#### hasSection

    @hasSection('test1')
    test1 section is present
    @endif

#### sectionMissing
    @sectionMissing('test1')
    test1 section is missing
    @endif

#### @env .env APP_ENV=local

    @env('local')
    @endenv

#### @production

    @production
    @endproduction


#### @switch

    @switch($someVar)
        @case(true)
            @break;  
        @case(false)
        @default
            @break;
    @endswitch

#### @for
    @for($i = 0; $i < 10; $i++)
        {{ $i }}
    @enfor

#### @foreach

    @foreach($items as $item)
    @endforeach

#### @forelse

#### @while

#### $loop

    @foreach($items as $item)

        {{$loop->last}}  true|false
        {{$loop->first}} true|false
        {{$loop->index}} iteration number
        {{$loop->count}} count of items
        {{$loop->odd}} 
        {{$loop->even}} 
        {{$loop->remaining}} 
        {{$loop->iteration}} 
        {{$loop->depth}} how many foreach's are present
        {{$loop->parent->index}} parent iteration number
        
    @endforeach


#### @php

    @php
    @endphp


#### @once
    @once('test')
        {{-- show this code only once --}}
#### @endonce

#### Form methods: 
    @csrf
    @method
    @method('PUT')
    @error('title')
    @enderror