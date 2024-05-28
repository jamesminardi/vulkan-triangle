function(target_treat_all_warnings_as_errors Target)
    # Treat warnings as errors
    set_target_properties(${Target} PROPERTIES COMPILE_WARNING_AS_ERROR OFF)

    # Turn all warnings on
    if (MSVC)
        target_compile_options(${Target} PRIVATE /W4)
    else()
        target_compile_options(${Target} PRIVATE -Wall -Wextra -pedantic)
    endif()

endfunction()


function(target_copy_resources Target ResourcesDir)

    add_custom_command(TARGET ${Target} POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E echo
            "Copy resources from ${CMAKE_SOURCE_DIR}/resources to $<TARGET_FILE_DIR:${Target}>/${ResourcesDir}")
    add_custom_command(
            TARGET ${Target} POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy_directory
            ${CMAKE_SOURCE_DIR}/resources $<TARGET_FILE_DIR:${Target}>/${ResourcesDir}
            COMMENT "Copying resources..." VERBATIM
    )
endfunction()