; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

%struct.Comm = type { i32, double, %struct.Comm* }
%struct._opaque_pthread_rwlock_t = type { i64, [192 x i8] }
%struct._opaque_pthread_rwlockattr_t = type { i64, [16 x i8] }
%struct._opaque_pthread_t = type { i64, %struct.__darwin_pthread_handler_rec*, [8176 x i8] }
%struct.__darwin_pthread_handler_rec = type { void (i8*)*, i8*, %struct.__darwin_pthread_handler_rec* }
%struct.Context = type { %struct.Comm*, %struct._opaque_pthread_rwlock_t }
%struct._opaque_pthread_attr_t = type { i64, [56 x i8] }

@.str = private unnamed_addr constant [38 x i8] c"calling function with thread id = %d\0A\00", align 1
@funs = global [2 x void (i8*)*] [void (i8*)* @quadratic_0, void (i8*)* @quadratic_1]
@str = private unnamed_addr constant [14 x i8] c"starting main\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i8* @init() #0 {
  %1 = tail call i8* @malloc(i64 208) #8
  %2 = bitcast i8* %1 to %struct.Comm**
  store %struct.Comm* null, %struct.Comm** %2, align 8, !tbaa !3
  %3 = getelementptr inbounds i8, i8* %1, i64 8
  %4 = bitcast i8* %3 to %struct._opaque_pthread_rwlock_t*
  %5 = tail call i32 @"\01_pthread_rwlock_init"(%struct._opaque_pthread_rwlock_t* nonnull %4, %struct._opaque_pthread_rwlockattr_t* null) #6
  ret i8* %1
}

; Function Attrs: nounwind allocsize(0)
declare noalias i8* @malloc(i64) local_unnamed_addr #1

declare i32 @"\01_pthread_rwlock_init"(%struct._opaque_pthread_rwlock_t*, %struct._opaque_pthread_rwlockattr_t*) local_unnamed_addr #2

; Function Attrs: nounwind ssp uwtable
define noalias i8* @_call_function(i8* nocapture readonly) #0 {
  %2 = tail call %struct._opaque_pthread_t* @pthread_self() #6
  %3 = ptrtoint %struct._opaque_pthread_t* %2 to i64
  %4 = trunc i64 %3 to i32
  %5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i64 0, i64 0), i32 %4)
  %6 = bitcast i8* %0 to void (%struct.Context*)**
  %7 = load void (%struct.Context*)*, void (%struct.Context*)** %6, align 8, !tbaa !10
  %8 = getelementptr inbounds i8, i8* %0, i64 8
  %9 = bitcast i8* %8 to %struct.Context**
  %10 = load %struct.Context*, %struct.Context** %9, align 8, !tbaa !12
  tail call void %7(%struct.Context* %10) #6
  ret i8* null
}

declare %struct._opaque_pthread_t* @pthread_self() local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind ssp uwtable
define i8* @call_partitioned_functions(i32, void (i8*)** nocapture readonly, i8*) #0 {
  %4 = sext i32 %0 to i64
  %5 = shl nsw i64 %4, 3
  %6 = tail call i8* @malloc(i64 %5) #8
  %7 = bitcast i8* %6 to %struct._opaque_pthread_t**
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %3
  %10 = zext i32 %0 to i64
  br label %12

; <label>:11:                                     ; preds = %12, %3
  ret i8* %6

; <label>:12:                                     ; preds = %12, %9
  %13 = phi i64 [ 0, %9 ], [ %23, %12 ]
  %14 = tail call i8* @malloc(i64 16) #8
  %15 = getelementptr inbounds void (i8*)*, void (i8*)** %1, i64 %13
  %16 = bitcast void (i8*)** %15 to i64*
  %17 = load i64, i64* %16, align 8, !tbaa !13
  %18 = bitcast i8* %14 to i64*
  store i64 %17, i64* %18, align 8, !tbaa !10
  %19 = getelementptr inbounds i8, i8* %14, i64 8
  %20 = bitcast i8* %19 to i8**
  store i8* %2, i8** %20, align 8, !tbaa !12
  %21 = getelementptr inbounds %struct._opaque_pthread_t*, %struct._opaque_pthread_t** %7, i64 %13
  %22 = tail call i32 @pthread_create(%struct._opaque_pthread_t** %21, %struct._opaque_pthread_attr_t* null, i8* (i8*)* nonnull @_call_function, i8* %14) #6
  %23 = add nuw nsw i64 %13, 1
  %24 = icmp eq i64 %23, %10
  br i1 %24, label %11, label %12
}

declare i32 @pthread_create(%struct._opaque_pthread_t**, %struct._opaque_pthread_attr_t*, i8* (i8*)*, i8*) local_unnamed_addr #2

; Function Attrs: nounwind ssp uwtable
define void @join_partitioned_functions(i32, i8* nocapture readonly) #0 {
  %3 = bitcast i8* %1 to %struct._opaque_pthread_t**
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %5, label %7

; <label>:5:                                      ; preds = %2
  %6 = zext i32 %0 to i64
  br label %8

; <label>:7:                                      ; preds = %8, %2
  ret void

; <label>:8:                                      ; preds = %8, %5
  %9 = phi i64 [ 0, %5 ], [ %13, %8 ]
  %10 = getelementptr inbounds %struct._opaque_pthread_t*, %struct._opaque_pthread_t** %3, i64 %9
  %11 = load %struct._opaque_pthread_t*, %struct._opaque_pthread_t** %10, align 8, !tbaa !13
  %12 = tail call i32 @"\01_pthread_join"(%struct._opaque_pthread_t* %11, i8** null) #6
  %13 = add nuw nsw i64 %9, 1
  %14 = icmp eq i64 %13, %6
  br i1 %14, label %7, label %8
}

declare i32 @"\01_pthread_join"(%struct._opaque_pthread_t*, i8**) local_unnamed_addr #2

; Function Attrs: nounwind ssp uwtable
define void @_add_channel(double, i32, %struct.Context* nocapture) local_unnamed_addr #0 {
  %4 = tail call i8* @malloc(i64 24) #8
  %5 = bitcast i8* %4 to i32*
  store i32 %1, i32* %5, align 8, !tbaa !14
  %6 = getelementptr inbounds i8, i8* %4, i64 8
  %7 = bitcast i8* %6 to double*
  store double %0, double* %7, align 8, !tbaa !18
  %8 = getelementptr inbounds i8, i8* %4, i64 16
  %9 = bitcast i8* %8 to %struct.Comm**
  store %struct.Comm* null, %struct.Comm** %9, align 8, !tbaa !19
  %10 = getelementptr inbounds %struct.Context, %struct.Context* %2, i64 0, i32 0
  %11 = load %struct.Comm*, %struct.Comm** %10, align 8, !tbaa !3
  %12 = icmp eq %struct.Comm* %11, null
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %3
  %14 = bitcast %struct.Context* %2 to i8**
  br label %23

; <label>:15:                                     ; preds = %15, %3
  %16 = phi %struct.Comm* [ %18, %15 ], [ %11, %3 ]
  %17 = getelementptr inbounds %struct.Comm, %struct.Comm* %16, i64 0, i32 2
  %18 = load %struct.Comm*, %struct.Comm** %17, align 8, !tbaa !19
  %19 = icmp eq %struct.Comm* %18, null
  br i1 %19, label %20, label %15

; <label>:20:                                     ; preds = %15
  %21 = getelementptr inbounds %struct.Comm, %struct.Comm* %16, i64 0, i32 2
  %22 = bitcast %struct.Comm** %21 to i8**
  br label %23

; <label>:23:                                     ; preds = %20, %13
  %24 = phi i8** [ %22, %20 ], [ %14, %13 ]
  store i8* %4, i8** %24, align 8, !tbaa !13
  ret void
}

; Function Attrs: norecurse nounwind readonly ssp uwtable
define double* @_find_channel(i32, %struct.Context* nocapture readonly) local_unnamed_addr #4 {
  %3 = getelementptr inbounds %struct.Context, %struct.Context* %1, i64 0, i32 0
  %4 = load %struct.Comm*, %struct.Comm** %3, align 8, !tbaa !13
  %5 = icmp eq %struct.Comm* %4, null
  br i1 %5, label %17, label %6

; <label>:6:                                      ; preds = %13, %2
  %7 = phi %struct.Comm* [ %15, %13 ], [ %4, %2 ]
  %8 = getelementptr inbounds %struct.Comm, %struct.Comm* %7, i64 0, i32 0
  %9 = load i32, i32* %8, align 8, !tbaa !14
  %10 = icmp eq i32 %9, %0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = getelementptr inbounds %struct.Comm, %struct.Comm* %7, i64 0, i32 1
  br label %17

; <label>:13:                                     ; preds = %6
  %14 = getelementptr inbounds %struct.Comm, %struct.Comm* %7, i64 0, i32 2
  %15 = load %struct.Comm*, %struct.Comm** %14, align 8, !tbaa !13
  %16 = icmp eq %struct.Comm* %15, null
  br i1 %16, label %17, label %6

; <label>:17:                                     ; preds = %13, %11, %2
  %18 = phi double* [ %12, %11 ], [ null, %2 ], [ null, %13 ]
  ret double* %18
}

; Function Attrs: nounwind ssp uwtable
define void @send(double, i32, i32, i8*) #0 {
  %5 = bitcast i8* %3 to %struct.Context*
  %6 = getelementptr inbounds i8, i8* %3, i64 8
  %7 = bitcast i8* %6 to %struct._opaque_pthread_rwlock_t*
  %8 = tail call i32 @"\01_pthread_rwlock_wrlock"(%struct._opaque_pthread_rwlock_t* nonnull %7) #6
  tail call void @_add_channel(double %0, i32 %2, %struct.Context* %5)
  %9 = tail call i32 @"\01_pthread_rwlock_unlock"(%struct._opaque_pthread_rwlock_t* nonnull %7) #6
  ret void
}

declare i32 @"\01_pthread_rwlock_wrlock"(%struct._opaque_pthread_rwlock_t*) local_unnamed_addr #2

declare i32 @"\01_pthread_rwlock_unlock"(%struct._opaque_pthread_rwlock_t*) local_unnamed_addr #2

; Function Attrs: nounwind ssp uwtable
define double @receive(i32, i32, i8*) #0 {
  %4 = bitcast i8* %2 to %struct.Context*
  %5 = getelementptr inbounds i8, i8* %2, i64 8
  %6 = bitcast i8* %5 to %struct._opaque_pthread_rwlock_t*
  br label %7

; <label>:7:                                      ; preds = %7, %3
  %8 = tail call i32 @"\01_pthread_rwlock_rdlock"(%struct._opaque_pthread_rwlock_t* nonnull %6) #6
  %9 = tail call double* @_find_channel(i32 %1, %struct.Context* %4)
  %10 = tail call i32 @"\01_pthread_rwlock_unlock"(%struct._opaque_pthread_rwlock_t* nonnull %6) #6
  %11 = icmp eq double* %9, null
  br i1 %11, label %7, label %12

; <label>:12:                                     ; preds = %7
  %13 = load double, double* %9, align 8, !tbaa !20
  ret double %13
}

declare i32 @"\01_pthread_rwlock_rdlock"(%struct._opaque_pthread_rwlock_t*) local_unnamed_addr #2

define void @quadratic_0(i8*) {
entry:
  %argument = call double @receive(i32 -1, i32 0, i8* %0)
  %argument1 = call double @receive(i32 -1, i32 1, i8* %0)
  %argument2 = call double @receive(i32 -1, i32 2, i8* %0)
  %1 = fmul double %argument1, %argument1, !start !21, !end !22
  %2 = fmul double %argument, 4.000000e+00, !start !23, !end !21
  call void @send(double %2, i32 1, i32 3, i8* %0)
  call void @send(double %argument2, i32 1, i32 4, i8* %0)
  call void @send(double %1, i32 1, i32 5, i8* %0)
  %3 = fmul double %argument, 2.000000e+00, !start !22, !end !24
  %4 = tail call i32 @"\01_sleep"(i32 1) #6, !start !24, !end !25
  %5 = tail call i32 @"\01_sleep"(i32 1) #6, !start !26, !end !27
  %6 = fsub double -0.000000e+00, %argument1, !start !25, !end !28
  call void @send(double %argument1, i32 1, i32 6, i8* %0)
  call void @send(double %3, i32 1, i32 7, i8* %0)
  %receive = call double @receive(i32 1, i32 8, i8* %0)
  %7 = fsub double %6, %receive, !start !28, !end !29
  %8 = fdiv double %7, %3, !start !29, !end !26
  call void @send(double %8, i32 1, i32 9, i8* %0)
  ret void
}

declare i32 @"\01_sleep"(i32)

define void @quadratic_1(i8*) {
entry:
  %receive = call double @receive(i32 0, i32 3, i8* %0)
  %receive1 = call double @receive(i32 0, i32 4, i8* %0)
  %1 = fmul double %receive, %receive1, !start !30, !end !31
  %receive2 = call double @receive(i32 0, i32 5, i8* %0)
  %2 = fsub double %receive2, %1, !start !31, !end !24
  %3 = tail call i32 @"\01_sleep"(i32 1) #6, !start !32, !end !33
  %4 = tail call i32 @"\01_sleep"(i32 1) #6, !start !34, !end !30
  %5 = tail call double @llvm.sqrt.f64(double %2), !start !24, !end !25
  %receive3 = call double @receive(i32 0, i32 6, i8* %0)
  %6 = fsub double %5, %receive3, !start !25, !end !28
  %receive4 = call double @receive(i32 0, i32 7, i8* %0)
  %7 = fdiv double %6, %receive4, !start !28, !end !32
  call void @send(double %5, i32 0, i32 8, i8* %0)
  %8 = fcmp une double %7, 0.000000e+00, !start !33, !end !35
  %receive5 = call double @receive(i32 0, i32 9, i8* %0)
  %9 = select i1 %8, double %7, double %receive5, !start !35, !end !36
  call void @send(double %9, i32 -1, i32 10, i8* %0), !start !36, !end !27
  ret void
}

; Function Attrs: nounwind readnone speculatable
declare double @llvm.sqrt.f64(double) #5

; Function Attrs: nounwind ssp uwtable
define double @quadratic(double, double, double) local_unnamed_addr #0 {
  %4 = fmul double %1, %1
  %5 = fmul double %0, 4.000000e+00
  %6 = fmul double %5, %2
  %7 = fsub double %4, %6
  %8 = fmul double %0, 2.000000e+00
  %9 = tail call i32 @"\01_sleep"(i32 1) #6
  %10 = tail call i32 @"\01_sleep"(i32 1) #6
  %11 = tail call i32 @"\01_sleep"(i32 1) #6
  %12 = tail call i32 @"\01_sleep"(i32 1) #6
  %13 = fsub double -0.000000e+00, %1
  %14 = tail call double @llvm.sqrt.f64(double %7)
  %15 = fsub double %14, %1
  %16 = fdiv double %15, %8
  %17 = fsub double %13, %14
  %18 = fdiv double %17, %8
  %19 = fcmp une double %16, 0.000000e+00
  %20 = select i1 %19, double %16, double %18
  ret double %20
}

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i32 @puts(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @str, i64 0, i64 0))
  %4 = getelementptr inbounds i8*, i8** %1, i64 1
  %5 = load i8*, i8** %4, align 8, !tbaa !13
  %6 = tail call i32 @atoi(i8* %5)
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds i8*, i8** %1, i64 2
  %9 = load i8*, i8** %8, align 8, !tbaa !13
  %10 = tail call i32 @atoi(i8* %9)
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds i8*, i8** %1, i64 3
  %13 = load i8*, i8** %12, align 8, !tbaa !13
  %14 = tail call i32 @atoi(i8* %13)
  %15 = sitofp i32 %14 to double
  %16 = tail call double @replace_quadratic(double %7, double %11, double %15)
  %17 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), double %16)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #6

; Function Attrs: nounwind readonly
declare i32 @atoi(i8* nocapture) local_unnamed_addr #7

define double @replace_quadratic(double, double, double) {
entry:
  %3 = call i8* @init()
  %threads = call i8* @call_partitioned_functions(i32 2, void (i8*)** getelementptr inbounds ([2 x void (i8*)*], [2 x void (i8*)*]* @funs, i32 0, i32 0), i8* %3)
  call void @send(double %0, i32 0, i32 0, i8* %3)
  call void @send(double %1, i32 0, i32 1, i8* %3)
  call void @send(double %2, i32 0, i32 2, i8* %3)
  %return = call double @receive(i32 -1, i32 10, i8* %3)
  call void @join_partitioned_functions(i32 2, i8* %threads)
  ret double %return
}

attributes #0 = { nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse nounwind readonly ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone speculatable }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { allocsize(0) }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2}

!0 = !{!"clang version 8.0.0 (tags/RELEASE_800/final)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!4, !5, i64 0}
!4 = !{!"Context", !5, i64 0, !8, i64 8}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"_opaque_pthread_rwlock_t", !9, i64 0, !6, i64 8}
!9 = !{!"long", !6, i64 0}
!10 = !{!11, !5, i64 0}
!11 = !{!"Closure", !5, i64 0, !5, i64 8}
!12 = !{!11, !5, i64 8}
!13 = !{!5, !5, i64 0}
!14 = !{!15, !16, i64 0}
!15 = !{!"Comm", !16, i64 0, !17, i64 8, !5, i64 16}
!16 = !{!"int", !6, i64 0}
!17 = !{!"double", !6, i64 0}
!18 = !{!15, !17, i64 8}
!19 = !{!15, !5, i64 16}
!20 = !{!17, !17, i64 0}
!21 = !{!"8"}
!22 = !{!"13"}
!23 = !{!"3"}
!24 = !{!"18"}
!25 = !{!"28"}
!26 = !{!"44"}
!27 = !{!"54"}
!28 = !{!"31"}
!29 = !{!"34"}
!30 = !{!"10"}
!31 = !{!"15"}
!32 = !{!"41"}
!33 = !{!"51"}
!34 = !{!"0"}
!35 = !{!"52"}
!36 = !{!"53"}