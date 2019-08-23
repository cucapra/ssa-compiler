; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

%struct.Context = type {}
%struct._opaque_pthread_t = type { i64, %struct.__darwin_pthread_handler_rec*, [8176 x i8] }
%struct.__darwin_pthread_handler_rec = type { void (i8*)*, i8*, %struct.__darwin_pthread_handler_rec* }
%struct._opaque_pthread_attr_t = type { i64, [56 x i8] }

@comms_0 = global { i64, i1, i32 } zeroinitializer
@comms_1 = global { i64, i1, i32 } zeroinitializer
@comms_2 = global { i64, i1, i32 } zeroinitializer
@comms_3 = global { i64, i1, i32 } zeroinitializer
@comms_4 = global { double, i1, i32 } zeroinitializer
@comms_5 = global { double, i1, i32 } zeroinitializer
@comms_6 = global { i64, i1, i32 } zeroinitializer
@comms_7 = global { i64, i1, i32 } zeroinitializer
@comms_8 = global { i64, i1, i32 } zeroinitializer
@comms_9 = global { i64, i1, i32 } zeroinitializer
@comms_10 = global { i1, i1, i32 } zeroinitializer
@comms_11 = global { i1, i1, i32 } zeroinitializer
@comms_12 = global { i1, i1, i32 } zeroinitializer
@return_struct = global { i1, i1, i32 } zeroinitializer
@a = global [3 x [3 x double]] [[3 x double] [double 1.000000e+00, double 1.000000e+00, double 1.000000e+00], [3 x double] [double 2.000000e+00, double 2.000000e+00, double 2.000000e+00], [3 x double] [double 3.000000e+00, double 3.000000e+00, double 3.000000e+00]], align 16
@b = global [3 x [3 x double]] [[3 x double] [double 1.000000e+00, double 2.000000e+00, double 3.000000e+00], [3 x double] [double 1.000000e+00, double 2.000000e+00, double 3.000000e+00], [3 x double] [double 1.000000e+00, double 2.000000e+00, double 3.000000e+00]], align 16
@res = global [3 x [3 x double]] zeroinitializer, align 16
@.str = dso_local constant [4 x i8] c"%f \00", align 1
@funs = global [2 x void (i8*)*] [void (i8*)* @_p_multiply_0, void (i8*)* @_p_multiply_1]

; Function Attrs: norecurse nounwind ssp uwtable
define void @_p_multiply() local_unnamed_addr #0 {
  br label %1

; <label>:1:                                      ; preds = %20, %0
  %2 = phi i64 [ 0, %0 ], [ %21, %20 ], !partition !3, !start !3, !end !3
  br label %3

; <label>:3:                                      ; preds = %17, %1
  %4 = phi i64 [ 0, %1 ], [ %18, %17 ], !partition !4, !start !3, !end !3
  %5 = getelementptr inbounds [3 x [3 x double]], [3 x [3 x double]]* @res, i64 0, i64 %2, i64 %4, !partition !3, !start !4, !end !5
  store double 0.000000e+00, double* %5, align 8, !tbaa !6, !partition !3, !start !3, !end !4
  br label %6

; <label>:6:                                      ; preds = %6, %3
  %7 = phi i64 [ 0, %3 ], [ %15, %6 ], !partition !4, !start !3, !end !3
  %8 = phi double [ 0.000000e+00, %3 ], [ %14, %6 ], !partition !4, !start !3, !end !3
  %9 = getelementptr inbounds [3 x [3 x double]], [3 x [3 x double]]* @a, i64 0, i64 %2, i64 %7, !partition !3, !start !4, !end !5
  %10 = load double, double* %9, align 8, !tbaa !6, !partition !3, !start !10, !end !11
  %11 = getelementptr inbounds [3 x [3 x double]], [3 x [3 x double]]* @b, i64 0, i64 %7, i64 %4, !partition !3, !start !12, !end !10
  %12 = load double, double* %11, align 8, !tbaa !6, !partition !3, !start !3, !end !4
  %13 = fmul double %10, %12, !partition !3, !start !5, !end !12
  %14 = fadd double %8, %13, !partition !4, !start !5, !end !12
  %15 = add nuw nsw i64 %7, 1, !partition !4, !start !12, !end !10
  %16 = icmp eq i64 %15, 3, !partition !4, !start !4, !end !5
  br i1 %16, label %17, label %6

; <label>:17:                                     ; preds = %6
  store double %14, double* %5, align 8, !tbaa !6, !partition !3, !start !3, !end !4
  %18 = add nuw nsw i64 %4, 1, !partition !3, !start !4, !end !5
  %19 = icmp eq i64 %18, 3, !partition !4, !start !3, !end !13
  br i1 %19, label %20, label %3

; <label>:20:                                     ; preds = %17
  %21 = add nuw nsw i64 %2, 1, !partition !3, !start !4, !end !5
  %22 = icmp eq i64 %21, 3, !partition !4, !start !3, !end !13
  br i1 %22, label %23, label %1

; <label>:23:                                     ; preds = %20
  ret void, !partition !3, !start !3, !end !4
}

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32, i8** nocapture readnone) local_unnamed_addr #1 {
  tail call void @replace__p_multiply()
  br label %3

; <label>:3:                                      ; preds = %12, %2
  %4 = phi i64 [ 0, %2 ], [ %14, %12 ]
  br label %5

; <label>:5:                                      ; preds = %5, %3
  %6 = phi i64 [ 0, %3 ], [ %10, %5 ]
  %7 = getelementptr inbounds [3 x [3 x double]], [3 x [3 x double]]* @res, i64 0, i64 %4, i64 %6
  %8 = load double, double* %7, align 8, !tbaa !6
  %9 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double %8)
  %10 = add nuw nsw i64 %6, 1
  %11 = icmp eq i64 %10, 3
  br i1 %11, label %12, label %5

; <label>:12:                                     ; preds = %5
  %13 = tail call i32 @putchar(i32 10)
  %14 = add nuw nsw i64 %4, 1
  %15 = icmp eq i64 %14, 3
  br i1 %15, label %16, label %3

; <label>:16:                                     ; preds = %12
  ret i32 0
}

define void @replace__p_multiply() {
entry:
  %0 = call i8* @init()
  %call_partitioned_functions = call i8* @call_partitioned_functions(i32 2, void (i8*)** getelementptr inbounds ([2 x void (i8*)*], [2 x void (i8*)*]* @funs, i32 0, i32 0), i8* %0)
  call void @join_partitioned_functions(i32 2, i8* %call_partitioned_functions)
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare i32 @putchar(i32) #3

define void @_p_multiply_0(i8*) {
entry:
  %send_alloca = alloca double, !reason !14
  %send_alloca21 = alloca i64, !reason !14
  %send_alloca23 = alloca i64, !reason !14
  %send_alloca25 = alloca i64, !reason !15
  %send_cast = bitcast double* %send_alloca to i8*, !reason !14
  %send_cast22 = bitcast i64* %send_alloca21 to i8*, !reason !14
  %send_cast24 = bitcast i64* %send_alloca23 to i8*, !reason !14
  %send_cast26 = bitcast i64* %send_alloca25 to i8*, !reason !15
  br label %l

l:                                                ; preds = %l4, %entry
  %new_phi = phi i64 [ 0, %entry ], [ %8, %l4 ]
  br label %l1

l1:                                               ; preds = %l3, %l
  %receive = call i8* bitcast (i8* (i32, i32, i64, i8*)* @receive to i8* (i64, i32, i64, i8*)*)(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i64 ptrtoint ({ i64, i1, i32 }* @comms_0 to i64), i8* %0), !reason !14
  %bitcast = bitcast i8* %receive to i64*, !reason !14
  %receive_load = load i64, i64* %bitcast, !reason !14
  call void bitcast (void (i64, i32, i8*)* @free_comms to void (i64, i64, i8*)*)(i64 ptrtoint ({ i64, i1, i32 }* @comms_0 to i64), i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i8* %0), !reason !14
  %1 = getelementptr inbounds [3 x [3 x double]], [3 x [3 x double]]* @res, i64 0, i64 %new_phi, i64 %receive_load, !partition !3, !start !4, !end !5
  store double 0.000000e+00, double* %1, align 8, !tbaa !6, !partition !3, !start !3, !end !4
  br label %l2

l2:                                               ; preds = %l2, %l1
  %receive6 = call i8* bitcast (i8* (i32, i32, i64, i8*)* @receive to i8* (i64, i32, i64, i8*)*)(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i64 ptrtoint ({ i64, i1, i32 }* @comms_1 to i64), i8* %0), !reason !14
  %bitcast7 = bitcast i8* %receive6 to i64*, !reason !14
  %receive_load8 = load i64, i64* %bitcast7, !reason !14
  call void bitcast (void (i64, i32, i8*)* @free_comms to void (i64, i64, i8*)*)(i64 ptrtoint ({ i64, i1, i32 }* @comms_1 to i64), i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i8* %0), !reason !14
  %2 = getelementptr inbounds [3 x [3 x double]], [3 x [3 x double]]* @a, i64 0, i64 %new_phi, i64 %receive_load8, !partition !3, !start !4, !end !5
  %3 = load double, double* %2, align 8, !tbaa !6, !partition !3, !start !10, !end !11
  %receive9 = call i8* bitcast (i8* (i32, i32, i64, i8*)* @receive to i8* (i64, i32, i64, i8*)*)(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i64 ptrtoint ({ i64, i1, i32 }* @comms_2 to i64), i8* %0), !reason !14
  %bitcast10 = bitcast i8* %receive9 to i64*, !reason !14
  %receive_load11 = load i64, i64* %bitcast10, !reason !14
  call void bitcast (void (i64, i32, i8*)* @free_comms to void (i64, i64, i8*)*)(i64 ptrtoint ({ i64, i1, i32 }* @comms_2 to i64), i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i8* %0), !reason !14
  %receive12 = call i8* bitcast (i8* (i32, i32, i64, i8*)* @receive to i8* (i64, i32, i64, i8*)*)(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i64 ptrtoint ({ i64, i1, i32 }* @comms_3 to i64), i8* %0), !reason !14
  %bitcast13 = bitcast i8* %receive12 to i64*, !reason !14
  %receive_load14 = load i64, i64* %bitcast13, !reason !14
  call void bitcast (void (i64, i32, i8*)* @free_comms to void (i64, i64, i8*)*)(i64 ptrtoint ({ i64, i1, i32 }* @comms_3 to i64), i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i8* %0), !reason !14
  %4 = getelementptr inbounds [3 x [3 x double]], [3 x [3 x double]]* @b, i64 0, i64 %receive_load11, i64 %receive_load14, !partition !3, !start !12, !end !10
  %5 = load double, double* %4, align 8, !tbaa !6, !partition !3, !start !3, !end !4
  %6 = fmul double %3, %5, !partition !3, !start !5, !end !12
  store double %6, double* %send_alloca, !reason !14
  call void bitcast (void (i8*, i32, i32, i64, i8*)* @send to void (i8*, i64, i32, i64, i8*)*)(i8* %send_cast, i64 ptrtoint (double* getelementptr (double, double* null, i32 1) to i64), i32 1, i64 ptrtoint ({ double, i1, i32 }* @comms_4 to i64), i8* %0), !reason !14
  %broadcast = call i8* bitcast (i8* (i32, i32, i64, i8*)* @receive to i8* (i64, i32, i64, i8*)*)(i64 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i64), i32 1, i64 ptrtoint ({ i1, i1, i32 }* @comms_10 to i64), i8* %0), !reason !16
  %bitcast27 = bitcast i8* %broadcast to i1*, !reason !16
  %receive_load28 = load i1, i1* %bitcast27, !reason !16
  call void bitcast (void (i64, i32, i8*)* @free_comms to void (i64, i64, i8*)*)(i64 ptrtoint ({ i1, i1, i32 }* @comms_10 to i64), i64 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i64), i8* %0), !reason !16
  br i1 %receive_load28, label %l3, label %l2

l3:                                               ; preds = %l2
  %receive15 = call i8* bitcast (i8* (i32, i32, i64, i8*)* @receive to i8* (i64, i32, i64, i8*)*)(i64 ptrtoint (double* getelementptr (double, double* null, i32 1) to i64), i32 1, i64 ptrtoint ({ double, i1, i32 }* @comms_5 to i64), i8* %0), !reason !14
  %bitcast16 = bitcast i8* %receive15 to double*, !reason !14
  %receive_load17 = load double, double* %bitcast16, !reason !14
  call void bitcast (void (i64, i32, i8*)* @free_comms to void (i64, i64, i8*)*)(i64 ptrtoint ({ double, i1, i32 }* @comms_5 to i64), i64 ptrtoint (double* getelementptr (double, double* null, i32 1) to i64), i8* %0), !reason !14
  store double %receive_load17, double* %1, align 8, !tbaa !6, !partition !3, !start !3, !end !4
  %receive18 = call i8* bitcast (i8* (i32, i32, i64, i8*)* @receive to i8* (i64, i32, i64, i8*)*)(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i64 ptrtoint ({ i64, i1, i32 }* @comms_6 to i64), i8* %0), !reason !14
  %bitcast19 = bitcast i8* %receive18 to i64*, !reason !14
  %receive_load20 = load i64, i64* %bitcast19, !reason !14
  call void bitcast (void (i64, i32, i8*)* @free_comms to void (i64, i64, i8*)*)(i64 ptrtoint ({ i64, i1, i32 }* @comms_6 to i64), i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i8* %0), !reason !14
  %7 = add nuw nsw i64 %receive_load20, 1, !partition !3, !start !4, !end !5
  store i64 %7, i64* %send_alloca21, !reason !14
  call void bitcast (void (i8*, i32, i32, i64, i8*)* @send to void (i8*, i64, i32, i64, i8*)*)(i8* %send_cast22, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i64 ptrtoint ({ i64, i1, i32 }* @comms_7 to i64), i8* %0), !reason !14
  store i64 %7, i64* %send_alloca25, !reason !15
  call void bitcast (void (i8*, i32, i32, i64, i8*)* @send to void (i8*, i64, i32, i64, i8*)*)(i8* %send_cast26, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i64 ptrtoint ({ i64, i1, i32 }* @comms_9 to i64), i8* %0), !reason !15
  %broadcast29 = call i8* bitcast (i8* (i32, i32, i64, i8*)* @receive to i8* (i64, i32, i64, i8*)*)(i64 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i64), i32 1, i64 ptrtoint ({ i1, i1, i32 }* @comms_11 to i64), i8* %0), !reason !16
  %bitcast30 = bitcast i8* %broadcast29 to i1*, !reason !16
  %receive_load31 = load i1, i1* %bitcast30, !reason !16
  call void bitcast (void (i64, i32, i8*)* @free_comms to void (i64, i64, i8*)*)(i64 ptrtoint ({ i1, i1, i32 }* @comms_11 to i64), i64 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i64), i8* %0), !reason !16
  br i1 %receive_load31, label %l4, label %l1

l4:                                               ; preds = %l3
  %8 = add nuw nsw i64 %new_phi, 1, !partition !3, !start !4, !end !5
  store i64 %8, i64* %send_alloca23, !reason !14
  call void bitcast (void (i8*, i32, i32, i64, i8*)* @send to void (i8*, i64, i32, i64, i8*)*)(i8* %send_cast24, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i64 ptrtoint ({ i64, i1, i32 }* @comms_8 to i64), i8* %0), !reason !14
  %broadcast32 = call i8* bitcast (i8* (i32, i32, i64, i8*)* @receive to i8* (i64, i32, i64, i8*)*)(i64 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i64), i32 1, i64 ptrtoint ({ i1, i1, i32 }* @comms_12 to i64), i8* %0), !reason !16
  %bitcast33 = bitcast i8* %broadcast32 to i1*, !reason !16
  %receive_load34 = load i1, i1* %bitcast33, !reason !16
  call void bitcast (void (i64, i32, i8*)* @free_comms to void (i64, i64, i8*)*)(i64 ptrtoint ({ i1, i1, i32 }* @comms_12 to i64), i64 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i64), i8* %0), !reason !16
  br i1 %receive_load34, label %l5, label %l

l5:                                               ; preds = %l4
  ret void
}

define void @_p_multiply_1(i8*) {
entry:
  %send_alloca = alloca i64, !reason !14
  %send_alloca8 = alloca i64, !reason !14
  %send_alloca10 = alloca i64, !reason !14
  %send_alloca12 = alloca i64, !reason !14
  %send_alloca14 = alloca double, !reason !14
  %send_alloca16 = alloca i64, !reason !14
  %send_alloca26 = alloca i1, !reason !17
  %send_alloca28 = alloca i1, !reason !17
  %send_alloca30 = alloca i1, !reason !17
  %send_cast = bitcast i64* %send_alloca to i8*, !reason !14
  %send_cast9 = bitcast i64* %send_alloca8 to i8*, !reason !14
  %send_cast11 = bitcast i64* %send_alloca10 to i8*, !reason !14
  %send_cast13 = bitcast i64* %send_alloca12 to i8*, !reason !14
  %send_cast15 = bitcast double* %send_alloca14 to i8*, !reason !14
  %send_cast17 = bitcast i64* %send_alloca16 to i8*, !reason !14
  %send_cast27 = bitcast i1* %send_alloca26 to i8*, !reason !17
  %send_cast29 = bitcast i1* %send_alloca28 to i8*, !reason !17
  %send_cast31 = bitcast i1* %send_alloca30 to i8*, !reason !17
  br label %l

l:                                                ; preds = %l4, %entry
  br label %l1

l1:                                               ; preds = %l3, %l
  %new_phi = phi i64 [ 0, %l ], [ %receive_load25, %l3 ]
  store i64 %new_phi, i64* %send_alloca, !reason !14
  call void bitcast (void (i8*, i32, i32, i64, i8*)* @send to void (i8*, i64, i32, i64, i8*)*)(i8* %send_cast, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 0, i64 ptrtoint ({ i64, i1, i32 }* @comms_0 to i64), i8* %0), !reason !14
  br label %l2

l2:                                               ; preds = %l2, %l1
  %new_phi6 = phi i64 [ 0, %l1 ], [ %2, %l2 ]
  %new_phi7 = phi double [ 0.000000e+00, %l1 ], [ %1, %l2 ]
  store i64 %new_phi6, i64* %send_alloca8, !reason !14
  call void bitcast (void (i8*, i32, i32, i64, i8*)* @send to void (i8*, i64, i32, i64, i8*)*)(i8* %send_cast9, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 0, i64 ptrtoint ({ i64, i1, i32 }* @comms_1 to i64), i8* %0), !reason !14
  store i64 %new_phi6, i64* %send_alloca10, !reason !14
  call void bitcast (void (i8*, i32, i32, i64, i8*)* @send to void (i8*, i64, i32, i64, i8*)*)(i8* %send_cast11, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 0, i64 ptrtoint ({ i64, i1, i32 }* @comms_2 to i64), i8* %0), !reason !14
  store i64 %new_phi, i64* %send_alloca12, !reason !14
  call void bitcast (void (i8*, i32, i32, i64, i8*)* @send to void (i8*, i64, i32, i64, i8*)*)(i8* %send_cast13, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 0, i64 ptrtoint ({ i64, i1, i32 }* @comms_3 to i64), i8* %0), !reason !14
  %receive = call i8* bitcast (i8* (i32, i32, i64, i8*)* @receive to i8* (i64, i32, i64, i8*)*)(i64 ptrtoint (double* getelementptr (double, double* null, i32 1) to i64), i32 0, i64 ptrtoint ({ double, i1, i32 }* @comms_4 to i64), i8* %0), !reason !14
  %bitcast = bitcast i8* %receive to double*, !reason !14
  %receive_load = load double, double* %bitcast, !reason !14
  call void bitcast (void (i64, i32, i8*)* @free_comms to void (i64, i64, i8*)*)(i64 ptrtoint ({ double, i1, i32 }* @comms_4 to i64), i64 ptrtoint (double* getelementptr (double, double* null, i32 1) to i64), i8* %0), !reason !14
  %1 = fadd double %new_phi7, %receive_load, !partition !4, !start !5, !end !12
  %2 = add nuw nsw i64 %new_phi6, 1, !partition !4, !start !12, !end !10
  %3 = icmp eq i64 %2, 3, !partition !4, !start !4, !end !5
  store i1 %3, i1* %send_alloca26, !reason !17
  call void bitcast (void (i8*, i32, i32, i64, i8*)* @send to void (i8*, i64, i32, i64, i8*)*)(i8* %send_cast27, i64 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i64), i32 0, i64 ptrtoint ({ i1, i1, i32 }* @comms_10 to i64), i8* %0), !reason !17
  br i1 %3, label %l3, label %l2

l3:                                               ; preds = %l2
  store double %1, double* %send_alloca14, !reason !14
  call void bitcast (void (i8*, i32, i32, i64, i8*)* @send to void (i8*, i64, i32, i64, i8*)*)(i8* %send_cast15, i64 ptrtoint (double* getelementptr (double, double* null, i32 1) to i64), i32 0, i64 ptrtoint ({ double, i1, i32 }* @comms_5 to i64), i8* %0), !reason !14
  store i64 %new_phi, i64* %send_alloca16, !reason !14
  call void bitcast (void (i8*, i32, i32, i64, i8*)* @send to void (i8*, i64, i32, i64, i8*)*)(i8* %send_cast17, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 0, i64 ptrtoint ({ i64, i1, i32 }* @comms_6 to i64), i8* %0), !reason !14
  %receive18 = call i8* bitcast (i8* (i32, i32, i64, i8*)* @receive to i8* (i64, i32, i64, i8*)*)(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 0, i64 ptrtoint ({ i64, i1, i32 }* @comms_7 to i64), i8* %0), !reason !14
  %bitcast19 = bitcast i8* %receive18 to i64*, !reason !14
  %receive_load20 = load i64, i64* %bitcast19, !reason !14
  call void bitcast (void (i64, i32, i8*)* @free_comms to void (i64, i64, i8*)*)(i64 ptrtoint ({ i64, i1, i32 }* @comms_7 to i64), i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i8* %0), !reason !14
  %4 = icmp eq i64 %receive_load20, 3, !partition !4, !start !3, !end !13
  %repair_phi = call i8* bitcast (i8* (i32, i32, i64, i8*)* @receive to i8* (i64, i32, i64, i8*)*)(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 0, i64 ptrtoint ({ i64, i1, i32 }* @comms_9 to i64), i8* %0), !reason !16
  %bitcast24 = bitcast i8* %repair_phi to i64*, !reason !16
  %receive_load25 = load i64, i64* %bitcast24, !reason !16
  call void bitcast (void (i64, i32, i8*)* @free_comms to void (i64, i64, i8*)*)(i64 ptrtoint ({ i64, i1, i32 }* @comms_9 to i64), i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i8* %0), !reason !16
  store i1 %4, i1* %send_alloca28, !reason !17
  call void bitcast (void (i8*, i32, i32, i64, i8*)* @send to void (i8*, i64, i32, i64, i8*)*)(i8* %send_cast29, i64 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i64), i32 0, i64 ptrtoint ({ i1, i1, i32 }* @comms_11 to i64), i8* %0), !reason !17
  br i1 %4, label %l4, label %l1

l4:                                               ; preds = %l3
  %receive21 = call i8* bitcast (i8* (i32, i32, i64, i8*)* @receive to i8* (i64, i32, i64, i8*)*)(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 0, i64 ptrtoint ({ i64, i1, i32 }* @comms_8 to i64), i8* %0), !reason !14
  %bitcast22 = bitcast i8* %receive21 to i64*, !reason !14
  %receive_load23 = load i64, i64* %bitcast22, !reason !14
  call void bitcast (void (i64, i32, i8*)* @free_comms to void (i64, i64, i8*)*)(i64 ptrtoint ({ i64, i1, i32 }* @comms_8 to i64), i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i8* %0), !reason !14
  %5 = icmp eq i64 %receive_load23, 3, !partition !4, !start !3, !end !13
  store i1 %5, i1* %send_alloca30, !reason !17
  call void bitcast (void (i8*, i32, i32, i64, i8*)* @send to void (i8*, i64, i32, i64, i8*)*)(i8* %send_cast31, i64 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i64), i32 0, i64 ptrtoint ({ i1, i1, i32 }* @comms_12 to i64), i8* %0), !reason !17
  br i1 %5, label %l5, label %l

l5:                                               ; preds = %l4
  ret void
}

; Function Attrs: norecurse nounwind ssp uwtable
define void @volatile_copy(i8*, i8*, i32) local_unnamed_addr #0 {
  %4 = icmp eq i32 %2, 0
  br i1 %4, label %14, label %5

; <label>:5:                                      ; preds = %5, %3
  %6 = phi i32 [ %12, %5 ], [ %2, %3 ]
  %7 = phi i8* [ %11, %5 ], [ %1, %3 ]
  %8 = phi i8* [ %10, %5 ], [ %0, %3 ]
  %9 = load volatile i8, i8* %7, align 1, !tbaa !18
  store volatile i8 %9, i8* %8, align 1, !tbaa !18
  %10 = getelementptr inbounds i8, i8* %8, i64 1
  %11 = getelementptr inbounds i8, i8* %7, i64 1
  %12 = add i32 %6, -1
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %5

; <label>:14:                                     ; preds = %5, %3
  ret void
}

; Function Attrs: norecurse nounwind readnone ssp uwtable
define noalias i8* @init() #4 {
  ret i8* null
}

; Function Attrs: nounwind ssp uwtable
define noalias i8* @_call_function(i8* nocapture readonly) #1 {
  %2 = bitcast i8* %0 to void (%struct.Context*)**
  %3 = load void (%struct.Context*)*, void (%struct.Context*)** %2, align 8, !tbaa !19
  %4 = getelementptr inbounds i8, i8* %0, i64 8
  %5 = bitcast i8* %4 to %struct.Context**
  %6 = load %struct.Context*, %struct.Context** %5, align 8, !tbaa !22
  tail call void %3(%struct.Context* %6) #3
  ret i8* null
}

; Function Attrs: nounwind ssp uwtable
define i8* @call_partitioned_functions(i32, void (i8*)** nocapture readonly, i8*) #1 {
  %4 = sext i32 %0 to i64
  %5 = shl nsw i64 %4, 3
  %6 = tail call i8* @malloc(i64 %5) #7
  %7 = bitcast i8* %6 to %struct._opaque_pthread_t**
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %9, label %24

; <label>:9:                                      ; preds = %3
  %10 = zext i32 %0 to i64
  br label %11

; <label>:11:                                     ; preds = %11, %9
  %12 = phi i64 [ 0, %9 ], [ %22, %11 ]
  %13 = tail call i8* @malloc(i64 16) #7
  %14 = getelementptr inbounds void (i8*)*, void (i8*)** %1, i64 %12
  %15 = bitcast void (i8*)** %14 to i64*
  %16 = load i64, i64* %15, align 8, !tbaa !23
  %17 = bitcast i8* %13 to i64*
  store i64 %16, i64* %17, align 8, !tbaa !19
  %18 = getelementptr inbounds i8, i8* %13, i64 8
  %19 = bitcast i8* %18 to i8**
  store i8* %2, i8** %19, align 8, !tbaa !22
  %20 = getelementptr inbounds %struct._opaque_pthread_t*, %struct._opaque_pthread_t** %7, i64 %12
  %21 = tail call i32 @pthread_create(%struct._opaque_pthread_t** %20, %struct._opaque_pthread_attr_t* null, i8* (i8*)* nonnull @_call_function, i8* %13) #3
  %22 = add nuw nsw i64 %12, 1
  %23 = icmp eq i64 %22, %10
  br i1 %23, label %24, label %11

; <label>:24:                                     ; preds = %11, %3
  ret i8* %6
}

; Function Attrs: nounwind allocsize(0)
declare noalias i8* @malloc(i64) local_unnamed_addr #5

declare i32 @pthread_create(%struct._opaque_pthread_t**, %struct._opaque_pthread_attr_t*, i8* (i8*)*, i8*) local_unnamed_addr #6

; Function Attrs: nounwind ssp uwtable
define void @join_partitioned_functions(i32, i8* nocapture readonly) #1 {
  %3 = bitcast i8* %1 to %struct._opaque_pthread_t**
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %5, label %14

; <label>:5:                                      ; preds = %2
  %6 = zext i32 %0 to i64
  br label %7

; <label>:7:                                      ; preds = %7, %5
  %8 = phi i64 [ 0, %5 ], [ %12, %7 ]
  %9 = getelementptr inbounds %struct._opaque_pthread_t*, %struct._opaque_pthread_t** %3, i64 %8
  %10 = load %struct._opaque_pthread_t*, %struct._opaque_pthread_t** %9, align 8, !tbaa !23
  %11 = tail call i32 @"\01_pthread_join"(%struct._opaque_pthread_t* %10, i8** null) #3
  %12 = add nuw nsw i64 %8, 1
  %13 = icmp eq i64 %12, %6
  br i1 %13, label %14, label %7

; <label>:14:                                     ; preds = %7, %2
  ret void
}

declare i32 @"\01_pthread_join"(%struct._opaque_pthread_t*, i8**) local_unnamed_addr #6

; Function Attrs: norecurse nounwind ssp uwtable
define void @send(i8*, i32, i32, i64, i8* nocapture readnone) #0 {
  %6 = inttoptr i64 %3 to i8*
  %7 = sext i32 %1 to i64
  %8 = getelementptr i8, i8* %6, i64 %7
  br label %9

; <label>:9:                                      ; preds = %9, %5
  %10 = load volatile i8, i8* %8, align 1, !tbaa !18
  %11 = icmp eq i8 %10, 0
  br i1 %11, label %12, label %9

; <label>:12:                                     ; preds = %9
  tail call void @volatile_copy(i8* nonnull %6, i8* %0, i32 %1)
  %13 = sext i32 %1 to i64
  %14 = getelementptr i8, i8* %6, i64 %13
  store i8 1, i8* %14, align 1, !tbaa !18
  ret void
}

; Function Attrs: norecurse nounwind ssp uwtable
define i8* @_receive(i32, i64, i8* nocapture readnone) local_unnamed_addr #0 {
  %4 = inttoptr i64 %1 to i8*
  %5 = sext i32 %0 to i64
  %6 = getelementptr i8, i8* %4, i64 %5
  br label %7

; <label>:7:                                      ; preds = %7, %3
  %8 = load volatile i8, i8* %6, align 1, !tbaa !18
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %7, label %10

; <label>:10:                                     ; preds = %7
  %11 = inttoptr i64 %1 to i8*
  ret i8* %11
}

; Function Attrs: norecurse nounwind ssp uwtable
define i8* @receive(i32, i32, i64, i8* nocapture readnone) #0 {
  %5 = tail call i8* @_receive(i32 %0, i64 %2, i8* undef)
  ret i8* %5
}

; Function Attrs: norecurse nounwind ssp uwtable
define void @free_comms(i64, i32, i8* nocapture readnone) #0 {
  %4 = inttoptr i64 %0 to i8*
  %5 = sext i32 %1 to i64
  %6 = getelementptr i8, i8* %4, i64 %5
  store volatile i8 0, i8* %6, align 1, !tbaa !18
  ret void
}

; Function Attrs: norecurse nounwind ssp uwtable
define void @send_argument(i8*, i32, i32, i64, i8* nocapture readnone) local_unnamed_addr #0 {
  tail call void @send(i8* %0, i32 %1, i32 undef, i64 %3, i8* undef)
  ret void
}

; Function Attrs: norecurse nounwind ssp uwtable
define i8* @receive_argument(i32, i64, i8* nocapture readnone) local_unnamed_addr #0 {
  %4 = tail call i8* @_receive(i32 %0, i64 %1, i8* undef)
  ret i8* %4
}

; Function Attrs: norecurse nounwind ssp uwtable
define void @send_return(i8*, i32, i8* nocapture readnone) local_unnamed_addr #0 {
  tail call void @send(i8* %0, i32 %1, i32 undef, i64 ptrtoint ({ i1, i1, i32 }* @return_struct to i64), i8* undef)
  ret void
}

; Function Attrs: norecurse nounwind ssp uwtable
define i8* @receive_return(i32, i8* nocapture readnone) local_unnamed_addr #0 {
  %3 = tail call i8* @_receive(i32 %0, i64 ptrtoint ({ i1, i1, i32 }* @return_struct to i64), i8* undef)
  ret i8* %3
}

; Function Attrs: norecurse nounwind ssp uwtable
define void @send_token(i32, i64, i8* nocapture readnone) local_unnamed_addr #0 {
  tail call void @send(i8* null, i32 0, i32 undef, i64 %1, i8* undef)
  ret void
}

; Function Attrs: norecurse nounwind ssp uwtable
define void @receive_token(i64, i8* nocapture readnone) local_unnamed_addr #0 {
  %3 = tail call i8* @_receive(i32 0, i64 %0, i8* undef)
  ret void
}

attributes #0 = { norecurse nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { norecurse nounwind readnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { allocsize(0) }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2}

!0 = !{!"clang version 8.0.1 (tags/RELEASE_801/final)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!"0"}
!4 = !{!"1"}
!5 = !{!"4"}
!6 = !{!7, !7, i64 0}
!7 = !{!"double", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"9"}
!11 = !{!"10"}
!12 = !{!"6"}
!13 = !{!"3"}
!14 = !{!"replace mapped op"}
!15 = !{!"repair_phi"}
!16 = !{!"receive"}
!17 = !{!"broadcast"}
!18 = !{!8, !8, i64 0}
!19 = !{!20, !21, i64 0}
!20 = !{!"Closure", !21, i64 0, !21, i64 8}
!21 = !{!"any pointer", !8, i64 0}
!22 = !{!20, !21, i64 8}
!23 = !{!21, !21, i64 0}
