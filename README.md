# FretboardDrawer

Draw fretboard structure

## Installation

Add this line to your application's Gemfile:

    gem 'fretboard_drawer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fretboard_drawer

## Usage

```
FretboardDrawer.number_of_frets = 6
```

```
FretboardDrawer.draw
```

<pre>
                3           5
e|-----|-----|-----|-----|-----|-----|
b|-----|-----|-----|-----|-----|-----|
g|-----|-----|-----|-----|-----|-----|
d|-----|-----|-----|-----|-----|-----|
a|-----|-----|-----|-----|-----|-----|
e|-----|-----|-----|-----|-----|-----|
</pre>

```
sounds = { 1 => { 3 => "g" }, 6 => { 5 => "a" } }
```

```
FretboardDrawer.draw(sounds)
```

<pre>
                3           5
e|-----|-----|--g--|-----|-----|-----|
b|-----|-----|-----|-----|-----|-----|
g|-----|-----|-----|-----|-----|-----|
d|-----|-----|-----|-----|-----|-----|
a|-----|-----|-----|-----|-----|-----|
e|-----|-----|-----|-----|--a--|-----|
</pre>

## Config

```
  FretboardDrawer::Config.number_of_strings # 6
```

```
  FretboardDrawer::Config.number_of_frets # 20
```

```
  FretboardDrawer::Config.use_stdout # true
```


By default FretboardDrawer.draw use puts to draw to stdout, to disable it: 

```
FretboardDrawer::Config.use_stdout = false
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
