

set(IMGUI_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/external/imgui)

# The core ImGui files
file(GLOB IMGUI_SOURCES ${IMGUI_INCLUDE_DIR}/*.cpp)
file(GLOB IMGUI_HEADERS ${IMGUI_INCLUDE_DIR}/*.h)

# Among the different backends available, we are interested in connecting
# the GUI to GLFW andWebGPU:
set(IMGUI_BACKENDS_DIR ${IMGUI_INCLUDE_DIR}/backends)
#set(IMGUI_BACKEND_SOURCES
#        ${IMGUI_BACKENDS_DIR}/imgui_impl_glfw.cpp
#        ${IMGUI_BACKENDS_DIR}/imgui_impl_wgpu.h)
#set(IMGUI_BACKEND_HEADERS
#        ${IMGUI_BACKENDS_DIR}/imgui_impl_wgpu.cpp)
#        ${IMGUI_BACKENDS_DIR}/imgui_impl_glfw.h


set(IMGUI_BACKEND_SOURCES
    ${IMGUI_BACKENDS_DIR}/imgui_impl_glfw.cpp
    ${IMGUI_BACKENDS_DIR}/imgui_impl_vulkan.cpp)
set(IMGUI_BACKEND_HEADERS
    ${IMGUI_BACKENDS_DIR}/imgui_impl_glfw.h
    ${IMGUI_BACKENDS_DIR}/imgui_impl_vulkan.h)



# Bonus to add some C++ specific features (the core ImGUi is a C library)
file(GLOB IMGUI_CPP_STL_SOURCES ${IMGUI_INCLUDE_DIR}/misc/*.cpp)
file(GLOB IMGUI_CPP_STL_HEADERS ${IMGUI_INCLUDE_DIR}/misc/*.h)

add_library(imgui STATIC
        ${IMGUI_SOURCES} ${IMGUI_SOURCES}
        ${IMGUI_BACKEND_HEADERS} ${IMGUI_BACKEND_SOURCES}
        ${IMGUI_CPP_STL_SOURCES} ${IMGUI_CPP_STL_HEADERS})

target_compile_definitions(imgui PUBLIC IMGUI_IMPL)
target_compile_definitions(imgui PUBLIC IMGUI_IMPL_OPENGL_LOADER_GLAD)

target_include_directories(imgui PUBLIC
    ${IMGUI_INCLUDE_DIR}
    ${IMGUI_BACKENDS_DIR}
    ${Vulkan_INCLUDE_DIR}
    ${GLFW_INCLUDE_DIR}
    ${SDL2_INCLUDE_DIRS}
    )

target_link_libraries(imgui PRIVATE glfw)

# C++11 is required by ImGui
set_target_properties(imgui PROPERTIES
        CXX_STANDARD 11
        CXX_STANDARD_REQUIRED ON
)