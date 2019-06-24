<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Laravel</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">

</head>

<body>
    <div id="app">
        <mainapp></mainapp>
    </div>
    <script src="/js/app.js"></script>
    <script>
        (function() {
            window.Laravel = {
                csrfToken: '{{ csrf_token() }}'
            };
            @if(Auth::check())
            window.authUser = {
                !Auth::user() !
            }
            @else
            window.authUser = false
            @endif
        })();
    </script>
</body>

</html> 