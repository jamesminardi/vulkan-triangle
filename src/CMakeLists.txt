

add_executable(app main.cpp)

set_target_properties(app PROPERTIES
        CXX_STANDARD 20
        CXX_EXTENSIONS OFF
)

target_treat_all_warnings_as_errors(app)