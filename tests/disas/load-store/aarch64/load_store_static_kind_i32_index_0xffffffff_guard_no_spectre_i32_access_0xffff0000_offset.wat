;;! target = "aarch64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation=false -O static-memory-forced -O static-memory-guard-size=4294967295 -O dynamic-memory-guard-size=4294967295"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i32 1)

  (func (export "do_store") (param i32 i32)
    local.get 0
    local.get 1
    i32.store offset=0xffff0000)

  (func (export "do_load") (param i32) (result i32)
    local.get 0
    i32.load offset=0xffff0000))

;; function u0:0:
;; block0:
;;   ldr x7, [x0, #80]
;;   add x7, x7, x2, UXTW
;;   movz x8, #65535, LSL #16
;;   str w3, [x7, x8]
;;   b label1
;; block1:
;;   ret
;;
;; function u0:1:
;; block0:
;;   ldr x7, [x0, #80]
;;   add x7, x7, x2, UXTW
;;   movz x8, #65535, LSL #16
;;   ldr w0, [x7, x8]
;;   b label1
;; block1:
;;   ret
