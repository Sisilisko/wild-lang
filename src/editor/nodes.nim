import sdl3

type
    NodeBody* = object
        rect*: ptr SDL_FRect
        color*: SDL_Color
        isDragged*: bool = false
        

    