import sdl3

import nodes

const ScreenHeight: cint = 400
const ScreenWidth: cint = 600

var editorWindow: SDL_Window
var renderer: SDL_Renderer


var allNodes: seq[NodeBody] = @[]


proc onLeftMouseButtonDown() =
    var mPosY, mPosX: cfloat
    discard SDL_GetMouseState(mPosX, mPosY)



proc handleInput() =
    var events: SDL_Event
    while SDL_PollEvent(events) == true:
        case events.type
            of SDL_EVENT_MOUSE_BUTTON_DOWN:
                onLeftMouseButtonDown()
            else:
                echo "Nope, not yet implemented! :("
        
        

proc editorLogic() =
    var isrunning: bool = true
    var selected: ptr NodeBody = nil

    SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255)
    SDL_RenderClear(renderer)
    SDL_RenderPresent(renderer)

    # Create main/init/start node:
    
    var execBlock: NodeBody = NodeBody()
    

    SDL_RenderClear(renderer)
    SDL_SetRenderDrawColor(renderer, 0, 0, 255, 255)
    SDL_RenderFillRect(renderer, nil)
    SDL_RenderPresent(renderer)

    while isrunning == true:
        # Here goes the main logic of the editor: :D
        handleInput()
        discard    



proc initEditor*() =
    var windowFlags: SDL_WindowFlags


    if SDL_Init(SDL_INIT_VIDEO) != true:
        raise newException(ValueError, "Failed to init")


    let worked: bool = SDL_CreateWindowAndRenderer("Wild", ScreenWidth, ScreenHeight, windowFlags, editorWindow, renderer)
    if worked == false:
        raise newException(ValueError, "Coulds create Window and renderer")
        

    if renderer.isNil:
        raise newException(ValueError, "variable renderer is nil!")

    if editorWindow.isNil:
        raise newException(ValueError, "editorWindow is nil!")

    editorLogic()

    SDL_DestroyWindow(editorWindow)
    SDL_Quit()

