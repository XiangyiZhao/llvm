; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -instcombine -S < %s | FileCheck %s

define i32 @shl_sub_i32(i32 %x) {
; CHECK-LABEL: @shl_sub_i32(
; CHECK-NEXT:    [[S:%.*]] = sub i32 31, [[X:%.*]]
; CHECK-NEXT:    [[R:%.*]] = shl i32 1, [[S]]
; CHECK-NEXT:    ret i32 [[R]]
;
  %s = sub i32 31, %x
  %r = shl i32 1, %s
  ret i32 %r
}

define i32 @shl_sub_multiuse_i32(i32 %x) {
; CHECK-LABEL: @shl_sub_multiuse_i32(
; CHECK-NEXT:    [[S:%.*]] = sub i32 31, [[X:%.*]]
; CHECK-NEXT:    call void @use(i32 [[S]])
; CHECK-NEXT:    [[R:%.*]] = shl i32 1, [[S]]
; CHECK-NEXT:    ret i32 [[R]]
;
  %s = sub i32 31, %x
  call void @use(i32 %s)
  %r = shl i32 1, %s
  ret i32 %r
}

define i8 @shl_sub_i8(i8 %x) {
; CHECK-LABEL: @shl_sub_i8(
; CHECK-NEXT:    [[S:%.*]] = sub i8 7, [[X:%.*]]
; CHECK-NEXT:    [[R:%.*]] = shl i8 1, [[S]]
; CHECK-NEXT:    ret i8 [[R]]
;
  %s = sub i8 7, %x
  %r = shl i8 1, %s
  ret i8 %r
}

define i64 @shl_sub_i64(i64 %x) {
; CHECK-LABEL: @shl_sub_i64(
; CHECK-NEXT:    [[S:%.*]] = sub i64 63, [[X:%.*]]
; CHECK-NEXT:    [[R:%.*]] = shl i64 1, [[S]]
; CHECK-NEXT:    ret i64 [[R]]
;
  %s = sub i64 63, %x
  %r = shl i64 1, %s
  ret i64 %r
}

define <2 x i64> @shl_sub_i64_vec(<2 x i64> %x) {
; CHECK-LABEL: @shl_sub_i64_vec(
; CHECK-NEXT:    [[S:%.*]] = sub <2 x i64> <i64 63, i64 63>, [[X:%.*]]
; CHECK-NEXT:    [[R:%.*]] = shl <2 x i64> <i64 1, i64 1>, [[S]]
; CHECK-NEXT:    ret <2 x i64> [[R]]
;
  %s = sub <2 x i64> <i64 63, i64 63>, %x
  %r = shl <2 x i64> <i64 1, i64 1>, %s
  ret <2 x i64> %r
}

; Negative tests

define i32 @shl_bad_sub_i32(i32 %x) {
; CHECK-LABEL: @shl_bad_sub_i32(
; CHECK-NEXT:    [[S:%.*]] = sub i32 32, [[X:%.*]]
; CHECK-NEXT:    [[R:%.*]] = shl i32 1, [[S]]
; CHECK-NEXT:    ret i32 [[R]]
;
  %s = sub i32 32, %x
  %r = shl i32 1, %s
  ret i32 %r
}

define i32 @bad_shl_sub_i32(i32 %x) {
; CHECK-LABEL: @bad_shl_sub_i32(
; CHECK-NEXT:    [[S:%.*]] = sub i32 31, [[X:%.*]]
; CHECK-NEXT:    [[R:%.*]] = shl i32 2, [[S]]
; CHECK-NEXT:    ret i32 [[R]]
;
  %s = sub i32 31, %x
  %r = shl i32 2, %s
  ret i32 %r
}

define i32 @shl_bad_sub2_i32(i32 %x) {
; CHECK-LABEL: @shl_bad_sub2_i32(
; CHECK-NEXT:    [[S:%.*]] = add i32 [[X:%.*]], -31
; CHECK-NEXT:    [[R:%.*]] = shl i32 1, [[S]]
; CHECK-NEXT:    ret i32 [[R]]
;
  %s = sub i32 %x, 31
  %r = shl i32 1, %s
  ret i32 %r
}

define i32 @bad_shl2_sub_i32(i32 %x) {
; CHECK-LABEL: @bad_shl2_sub_i32(
; CHECK-NEXT:    [[S:%.*]] = add i32 [[X:%.*]], -31
; CHECK-NEXT:    [[R:%.*]] = shl i32 1, [[S]]
; CHECK-NEXT:    ret i32 [[R]]
;
  %s = sub i32 %x, 31
  %r = shl i32 1, %s
  ret i32 %r
}

define i8 @shl_bad_sub_i8(i8 %x) {
; CHECK-LABEL: @shl_bad_sub_i8(
; CHECK-NEXT:    [[S:%.*]] = sub i8 4, [[X:%.*]]
; CHECK-NEXT:    [[R:%.*]] = shl i8 1, [[S]]
; CHECK-NEXT:    ret i8 [[R]]
;
  %s = sub i8 4, %x
  %r = shl i8 1, %s
  ret i8 %r
}

define i64 @shl_bad_sub_i64(i64 %x) {
; CHECK-LABEL: @shl_bad_sub_i64(
; CHECK-NEXT:    [[S:%.*]] = sub i64 67, [[X:%.*]]
; CHECK-NEXT:    [[R:%.*]] = shl i64 1, [[S]]
; CHECK-NEXT:    ret i64 [[R]]
;
  %s = sub i64 67, %x
  %r = shl i64 1, %s
  ret i64 %r
}

define <2 x i64> @shl_bad_sub_i64_vec(<2 x i64> %x) {
; CHECK-LABEL: @shl_bad_sub_i64_vec(
; CHECK-NEXT:    [[S:%.*]] = sub <2 x i64> <i64 53, i64 53>, [[X:%.*]]
; CHECK-NEXT:    [[R:%.*]] = shl <2 x i64> <i64 1, i64 1>, [[S]]
; CHECK-NEXT:    ret <2 x i64> [[R]]
;
  %s = sub <2 x i64> <i64 53, i64 53>, %x
  %r = shl <2 x i64> <i64 1, i64 1>, %s
  ret <2 x i64> %r
}

define <2 x i64> @bad_shl_sub_i64_vec(<2 x i64> %x) {
; CHECK-LABEL: @bad_shl_sub_i64_vec(
; CHECK-NEXT:    [[S:%.*]] = sub <2 x i64> <i64 63, i64 63>, [[X:%.*]]
; CHECK-NEXT:    [[R:%.*]] = shl <2 x i64> <i64 2, i64 2>, [[S]]
; CHECK-NEXT:    ret <2 x i64> [[R]]
;
  %s = sub <2 x i64> <i64 63, i64 63>, %x
  %r = shl <2 x i64> <i64 2, i64 2>, %s
  ret <2 x i64> %r
}

define <3 x i64> @shl_sub_i64_vec_undef0(<3 x i64> %x) {
; CHECK-LABEL: @shl_sub_i64_vec_undef0(
; CHECK-NEXT:    [[S:%.*]] = sub <3 x i64> <i64 63, i64 undef, i64 63>, [[X:%.*]]
; CHECK-NEXT:    [[R:%.*]] = shl <3 x i64> <i64 1, i64 1, i64 1>, [[S]]
; CHECK-NEXT:    ret <3 x i64> [[R]]
;
  %s = sub <3 x i64> <i64 63, i64 undef, i64 63>, %x
  %r = shl <3 x i64> <i64 1, i64 1, i64 1>, %s
  ret <3 x i64> %r
}

define <3 x i64> @shl_sub_i64_vec_undef1(<3 x i64> %x) {
; CHECK-LABEL: @shl_sub_i64_vec_undef1(
; CHECK-NEXT:    [[S:%.*]] = sub <3 x i64> <i64 63, i64 undef, i64 63>, [[X:%.*]]
; CHECK-NEXT:    [[R:%.*]] = shl <3 x i64> <i64 1, i64 undef, i64 1>, [[S]]
; CHECK-NEXT:    ret <3 x i64> [[R]]
;
  %s = sub <3 x i64> <i64 63, i64 undef, i64 63>, %x
  %r = shl <3 x i64> <i64 1, i64 undef, i64 1>, %s
  ret <3 x i64> %r
}

define <3 x i64> @shl_sub_i64_vec_undef2(<3 x i64> %x) {
; CHECK-LABEL: @shl_sub_i64_vec_undef2(
; CHECK-NEXT:    [[S:%.*]] = sub <3 x i64> <i64 63, i64 undef, i64 63>, [[X:%.*]]
; CHECK-NEXT:    [[R:%.*]] = shl <3 x i64> <i64 1, i64 undef, i64 1>, [[S]]
; CHECK-NEXT:    ret <3 x i64> [[R]]
;
  %s = sub <3 x i64> <i64 63, i64 undef, i64 63>, %x
  %r = shl <3 x i64> <i64 1, i64 undef, i64 1>, %s
  ret <3 x i64> %r
}


declare void @use(i32)
