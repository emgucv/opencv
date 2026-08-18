# stb_image / stb_image_write

Single-header, public-domain (also MIT-licensed) image codecs from
https://github.com/nothings/stb, vendored at commit `2c980bb59875b0d32144a71867fbdebb2f77cd20`.

Used only as a JPEG codec backend for the Emscripten/WebAssembly build target
(see `../../modules/imgcodecs/src/grfmt_jpeg.cpp`), because unlike
libjpeg-turbo's `setjmp`/`longjmp`-based error handling, stb_image's plain
return-code error handling doesn't crash LLVM's `wasm-ld` under
`-fwasm-exceptions`. See
`../../../platforms/emscripten/JPEG_WASM_CRASH.md` for the full
investigation. Every other platform continues to use libjpeg-turbo
(`../libjpeg-turbo/`) unchanged.

Not built as its own CMake target — it's header-only and included directly
by `grfmt_jpeg.cpp` for the `__EMSCRIPTEN__` build path.
