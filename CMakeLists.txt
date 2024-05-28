
cmake_minimum_required(VERSION 3.20)
project(vulkan-triangle)

include(cmake/utils.cmake)
include(cmake/imgui.cmake)

# We add an option to enable different settings when developping the app than
# when distributing it.
option(DEV_MODE "Set up development helper settings" ON)

set(CMAKE_CXX_STANDARD 17)
find_package(Vulkan REQUIRED)

add_subdirectory(external/glfw)
add_subdirectory(external/glm)
add_subdirectory(src)

if(DEV_MODE)
    # Load resources from the source tree to allow for
    # dynamic editing of resources (like shaders)
    target_compile_definitions(app PRIVATE
            RESOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}/resources"
    )
else()
    # Load resources relatively to wherever the
    # executable is launched from so the binary is portable
    target_compile_definitions(app PRIVATE
            RESOURCE_DIR="./resources"
    )

    target_copy_resources(app resources)

endif()


target_link_libraries(app
    glfw
    glm
    imgui
    Vulkan::Vulkan
    )

target_include_directories(app PUBLIC
        # For includes header libraries (like stb)
    )


# Disable GLFW build examples, tests, docs
set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_DOCS OFF CACHE BOOL "" FORCE)