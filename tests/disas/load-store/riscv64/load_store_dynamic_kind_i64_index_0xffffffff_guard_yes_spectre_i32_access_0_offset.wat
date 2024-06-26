;;! target = "riscv64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation -W memory64 -O static-memory-maximum-size=0 -O static-memory-guard-size=4294967295 -O dynamic-memory-guard-size=4294967295"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i64 1)

  (func (export "do_store") (param i64 i32)
    local.get 0
    local.get 1
    i32.store offset=0)

  (func (export "do_load") (param i64) (result i32)
    local.get 0
    i32.load offset=0))

;; function u0:0:
;; block0:
;;   ld a5,88(a0)
;;   ld a0,80(a0)
;;   sltu a1,a5,a2
;;   add a5,a0,a2
;;   sub a4,zero,a1
;;   not a0,a4
;;   and a1,a5,a0
;;   sw a3,0(a1)
;;   j label1
;; block1:
;;   ret
;;
;; function u0:1:
;; block0:
;;   ld a5,88(a0)
;;   ld a0,80(a0)
;;   sltu a1,a5,a2
;;   add a5,a0,a2
;;   sub a3,zero,a1
;;   not a0,a3
;;   and a1,a5,a0
;;   lw a0,0(a1)
;;   j label1
;; block1:
;;   ret
