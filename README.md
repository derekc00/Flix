

## "iTunes App"?? 
Use the [iTunes Api](https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/iTuneSearchAPI/Searching.html#//apple_ref/doc/uid/TP40017632-CH5-SW1) to receive tracks (songs) and albums to display in a list and grid layout

I used this request to receive 200 tracks by Jack Johnson

`https://itunes.apple.com/search?term=jack_johnson&country=US&media=music&limit=200`

## Todo
1. Rename project name

## Architecture
- MVC (Model View Controller)

## Potholes to beware (for tech writers)
1. 

## Strech goals for students
- Album detail view when tapping a album cell. Currently, there is no action when tapping a cell since there is only a track detail view.
    - checkout [this commit](https://github.com/derekc00/Flix/commit/3588e077d2f9d7ab5e5c17b98dc4502bde2aee9a) for first steps to do this.
- Find creative ways to use the information from the json response such as using the iTunes links
