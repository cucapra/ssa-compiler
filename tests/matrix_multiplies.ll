; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

%struct.Comm = type { i32, i32, i8*, %struct.Comm* }
%struct._opaque_pthread_rwlock_t = type { i64, [192 x i8] }
%struct._opaque_pthread_rwlockattr_t = type { i64, [16 x i8] }
%struct.Context = type { %struct.Comm*, %struct._opaque_pthread_rwlock_t }
%struct._opaque_pthread_t = type { i64, %struct.__darwin_pthread_handler_rec*, [8176 x i8] }
%struct.__darwin_pthread_handler_rec = type { void (i8*)*, i8*, %struct.__darwin_pthread_handler_rec* }
%struct._opaque_pthread_attr_t = type { i64, [56 x i8] }

@__const.main.a = global [3 x [3 x double]] [[3 x double] [double 1.000000e+00, double 1.000000e+00, double 1.000000e+00], [3 x double] [double 2.000000e+00, double 2.000000e+00, double 2.000000e+00], [3 x double] [double 3.000000e+00, double 3.000000e+00, double 3.000000e+00]]
@__const.main.b = global [3 x [3 x double]] [[3 x double] [double 1.000000e+00, double 2.000000e+00, double 3.000000e+00], [3 x double] [double 1.000000e+00, double 2.000000e+00, double 3.000000e+00], [3 x double] [double 1.000000e+00, double 2.000000e+00, double 3.000000e+00]]
@.str = global [4 x i8] c"%f \00"
@funs = global [2 x void (i8*)*] [void (i8*)* @multiply_0, void (i8*)* @multiply_1]
@__const.main.a.1 = private unnamed_addr constant [3 x [3 x double]] [[3 x double] [double 1.000000e+00, double 1.000000e+00, double 1.000000e+00], [3 x double] [double 2.000000e+00, double 2.000000e+00, double 2.000000e+00], [3 x double] [double 3.000000e+00, double 3.000000e+00, double 3.000000e+00]], align 16
@__const.main.b.2 = private unnamed_addr constant [3 x [3 x double]] [[3 x double] [double 1.000000e+00, double 2.000000e+00, double 3.000000e+00], [3 x double] [double 1.000000e+00, double 2.000000e+00, double 3.000000e+00], [3 x double] [double 1.000000e+00, double 2.000000e+00, double 3.000000e+00]], align 16
@.str.3 = private unnamed_addr constant [4 x i8] c"%f \00", align 1
@.str.12 = private unnamed_addr constant [64 x i8] c"WARNING: receive with ID [%d] expected size %d but has size %d\0A\00", align 1

define void @multiply_0(i8*) {
entry:
  %argument74 = call i8* bitcast (i8* (i32, i32, i8*)* @receive_argument to i8* (i64, i32, i8*)*)(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 29, i8* %0), !reason !3
  %bitcast75 = bitcast i8* %argument74 to [3 x double]**, !reason !3
  %receive_load76 = load [3 x double]*, [3 x double]** %bitcast75, !reason !3
  %argument19 = call i8* bitcast (i8* (i32, i32, i8*)* @receive_argument to i8* (i64, i32, i8*)*)(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 8, i8* %0), !reason !3
  %bitcast20 = bitcast i8* %argument19 to [3 x double]**, !reason !3
  %receive_load21 = load [3 x double]*, [3 x double]** %bitcast20, !reason !3
  %argument = call i8* bitcast (i8* (i32, i32, i8*)* @receive_argument to i8* (i64, i32, i8*)*)(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 6, i8* %0), !reason !3
  %bitcast14 = bitcast i8* %argument to [3 x double]**, !reason !3
  %receive_load15 = load [3 x double]*, [3 x double]** %bitcast14, !reason !3
  br label %l

l:                                                ; preds = %l4, %entry
  %new_phi = phi i64 [ 0, %entry ], [ %19, %l4 ], !time !4
  br label %l1

l1:                                               ; preds = %l3, %l
  %send_alloca = alloca i64, !reason !5
  store i64 %new_phi, i64* %send_alloca, !reason !5
  %send_cast = bitcast i64* %send_alloca to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i32 1, i8* %0), !reason !5
  %receive = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 1, i32 2, i8* %0), !reason !5
  %bitcast = bitcast i8* %receive to double**, !reason !5
  %receive_load = load double*, double** %bitcast, !reason !5
  store double 0.000000e+00, double* %receive_load, align 8, !tbaa !6, !time !10
  %send_alloca9 = alloca i64, !reason !5
  store i64 %new_phi, i64* %send_alloca9, !reason !5
  %send_cast10 = bitcast i64* %send_alloca9 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast10, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i32 4, i8* %0), !reason !5
  %receive11 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 1, i32 5, i8* %0), !reason !5
  %bitcast12 = bitcast i8* %receive11 to double**, !reason !5
  %receive_load13 = load double*, double** %bitcast12, !reason !5
  store double 0.000000e+00, double* %receive_load13, align 8, !tbaa !6, !time !11
  %receive16 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i32 7, i8* %0), !reason !5
  %bitcast17 = bitcast i8* %receive16 to i64*, !reason !5
  %receive_load18 = load i64, i64* %bitcast17, !reason !5
  %1 = getelementptr inbounds [3 x double], [3 x double]* %receive_load15, i64 %new_phi, i64 %receive_load18, !time !12
  store double 0.000000e+00, double* %1, align 8, !tbaa !6, !time !13
  br label %l2

l2:                                               ; preds = %l2, %l1
  %receive22 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i32 9, i8* %0), !reason !5
  %bitcast23 = bitcast i8* %receive22 to i64*, !reason !5
  %receive_load24 = load i64, i64* %bitcast23, !reason !5
  %2 = getelementptr inbounds [3 x double], [3 x double]* %receive_load21, i64 %new_phi, i64 %receive_load24, !time !14
  %3 = load double, double* %2, align 8, !tbaa !6, !time !11
  %receive25 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 1, i32 11, i8* %0), !reason !5
  %bitcast26 = bitcast i8* %receive25 to double**, !reason !5
  %receive_load27 = load double*, double** %bitcast26, !reason !5
  %4 = load double, double* %receive_load27, align 8, !tbaa !6, !time !15
  %5 = fmul double %3, %4, !time !16
  %6 = tail call double @llvm.sqrt.f64(double %5), !time !17
  %receive28 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 1, i32 12, i8* %0), !reason !5
  %bitcast29 = bitcast i8* %receive28 to double**, !reason !5
  %receive_load30 = load double*, double** %bitcast29, !reason !5
  %7 = load double, double* %receive_load30, align 8, !tbaa !6, !time !18
  %8 = fadd double %7, %6, !time !19
  %receive31 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 1, i32 13, i8* %0), !reason !5
  %bitcast32 = bitcast i8* %receive31 to double**, !reason !5
  %receive_load33 = load double*, double** %bitcast32, !reason !5
  store double %8, double* %receive_load33, align 8, !tbaa !6, !time !20
  %9 = load double, double* %2, align 8, !tbaa !6, !time !21
  %send_alloca34 = alloca double, !reason !5
  store double %9, double* %send_alloca34, !reason !5
  %send_cast35 = bitcast double* %send_alloca34 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast35, i64 ptrtoint (double* getelementptr (double, double* null, i32 1) to i64), i32 1, i32 14, i8* %0), !reason !5
  %receive36 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 1, i32 15, i8* %0), !reason !5
  %bitcast37 = bitcast i8* %receive36 to double**, !reason !5
  %receive_load38 = load double*, double** %bitcast37, !reason !5
  %10 = load double, double* %receive_load38, align 8, !tbaa !6, !time !22
  %send_alloca39 = alloca double, !reason !5
  store double %10, double* %send_alloca39, !reason !5
  %send_cast40 = bitcast double* %send_alloca39 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast40, i64 ptrtoint (double* getelementptr (double, double* null, i32 1) to i64), i32 1, i32 16, i8* %0), !reason !5
  %receive41 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 1, i32 17, i8* %0), !reason !5
  %bitcast42 = bitcast i8* %receive41 to double**, !reason !5
  %receive_load43 = load double*, double** %bitcast42, !reason !5
  %11 = load double, double* %receive_load43, align 8, !tbaa !6, !time !23
  %send_alloca44 = alloca double, !reason !5
  store double %11, double* %send_alloca44, !reason !5
  %send_cast45 = bitcast double* %send_alloca44 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast45, i64 ptrtoint (double* getelementptr (double, double* null, i32 1) to i64), i32 1, i32 18, i8* %0), !reason !5
  %receive46 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (double* getelementptr (double, double* null, i32 1) to i64), i32 1, i32 19, i8* %0), !reason !5
  %bitcast47 = bitcast i8* %receive46 to double*, !reason !5
  %receive_load48 = load double, double* %bitcast47, !reason !5
  %receive49 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 1, i32 20, i8* %0), !reason !5
  %bitcast50 = bitcast i8* %receive49 to double**, !reason !5
  %receive_load51 = load double*, double** %bitcast50, !reason !5
  store double %receive_load48, double* %receive_load51, align 8, !tbaa !6, !time !24
  %12 = load double, double* %2, align 8, !tbaa !6, !time !25
  %receive52 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 1, i32 21, i8* %0), !reason !5
  %bitcast53 = bitcast i8* %receive52 to double**, !reason !5
  %receive_load54 = load double*, double** %bitcast53, !reason !5
  %13 = load double, double* %receive_load54, align 8, !tbaa !6, !time !26
  %send_alloca55 = alloca double, !reason !5
  store double %13, double* %send_alloca55, !reason !5
  %send_cast56 = bitcast double* %send_alloca55 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast56, i64 ptrtoint (double* getelementptr (double, double* null, i32 1) to i64), i32 1, i32 22, i8* %0), !reason !5
  %send_alloca57 = alloca double, !reason !5
  store double %12, double* %send_alloca57, !reason !5
  %send_cast58 = bitcast double* %send_alloca57 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast58, i64 ptrtoint (double* getelementptr (double, double* null, i32 1) to i64), i32 1, i32 23, i8* %0), !reason !5
  %14 = load double, double* %1, align 8, !tbaa !6, !time !27
  %receive59 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (double* getelementptr (double, double* null, i32 1) to i64), i32 1, i32 24, i8* %0), !reason !5
  %bitcast60 = bitcast i8* %receive59 to double*, !reason !5
  %receive_load61 = load double, double* %bitcast60, !reason !5
  %15 = fadd double %14, %receive_load61, !time !28
  store double %15, double* %1, align 8, !tbaa !6, !time !29
  %receive62 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i32 25, i8* %0), !reason !5
  %bitcast63 = bitcast i8* %receive62 to i64*, !reason !5
  %receive_load64 = load i64, i64* %bitcast63, !reason !5
  %16 = icmp eq i64 %receive_load64, 3, !time !30
  %send_alloca92 = alloca i1, !reason !31
  store i1 %16, i1* %send_alloca92, !reason !31
  %send_cast93 = bitcast i1* %send_alloca92 to i8*, !reason !31
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast93, i64 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i64), i32 1, i32 38, i8* %0), !reason !31
  br i1 %16, label %l3, label %l2

l3:                                               ; preds = %l2
  %receive65 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i32 26, i8* %0), !reason !5
  %bitcast66 = bitcast i8* %receive65 to i64*, !reason !5
  %receive_load67 = load i64, i64* %bitcast66, !reason !5
  %17 = add nuw nsw i64 %receive_load67, 1, !time !32
  %18 = icmp eq i64 %17, 3, !time !33
  %send_alloca90 = alloca i64, !reason !34
  store i64 %17, i64* %send_alloca90, !reason !34
  %send_cast91 = bitcast i64* %send_alloca90 to i8*, !reason !34
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast91, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i32 37, i8* %0), !reason !34
  %send_alloca94 = alloca i1, !reason !31
  store i1 %18, i1* %send_alloca94, !reason !31
  %send_cast95 = bitcast i1* %send_alloca94 to i8*, !reason !31
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast95, i64 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i64), i32 1, i32 39, i8* %0), !reason !31
  br i1 %18, label %l4, label %l1

l4:                                               ; preds = %l3
  %19 = add nuw nsw i64 %new_phi, 1, !time !32
  %20 = icmp eq i64 %19, 3, !time !33
  %send_alloca96 = alloca i1, !reason !31
  store i1 %20, i1* %send_alloca96, !reason !31
  %send_cast97 = bitcast i1* %send_alloca96 to i8*, !reason !31
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast97, i64 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i64), i32 1, i32 40, i8* %0), !reason !31
  br i1 %20, label %l5, label %l

l5:                                               ; preds = %l7, %l4
  %new_phi68 = phi i64 [ %27, %l7 ], [ 0, %l4 ], !time !4
  br label %l6

l6:                                               ; preds = %l6, %l5
  %send_alloca69 = alloca i64, !reason !5
  store i64 %new_phi68, i64* %send_alloca69, !reason !5
  %send_cast70 = bitcast i64* %send_alloca69 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast70, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i32 27, i8* %0), !reason !5
  %receive71 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 1, i32 28, i8* %0), !reason !5
  %bitcast72 = bitcast i8* %receive71 to double**, !reason !5
  %receive_load73 = load double*, double** %bitcast72, !reason !5
  %21 = load double, double* %receive_load73, align 8, !tbaa !6, !time !13
  %receive77 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i32 30, i8* %0), !reason !5
  %bitcast78 = bitcast i8* %receive77 to i64*, !reason !5
  %receive_load79 = load i64, i64* %bitcast78, !reason !5
  %22 = getelementptr inbounds [3 x double], [3 x double]* %receive_load76, i64 %new_phi68, i64 %receive_load79, !time !33
  %23 = load double, double* %22, align 8, !tbaa !6, !time !35
  %24 = fadd double %21, %23, !time !36
  %send_alloca80 = alloca i64, !reason !5
  store i64 %new_phi68, i64* %send_alloca80, !reason !5
  %send_cast81 = bitcast i64* %send_alloca80 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast81, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i32 32, i8* %0), !reason !5
  %receive82 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 1, i32 33, i8* %0), !reason !5
  %bitcast83 = bitcast i8* %receive82 to double**, !reason !5
  %receive_load84 = load double*, double** %bitcast83, !reason !5
  %25 = load double, double* %receive_load84, align 8, !tbaa !6, !time !22
  %26 = fadd double %24, %25, !time !37
  %send_alloca85 = alloca i64, !reason !5
  store i64 %new_phi68, i64* %send_alloca85, !reason !5
  %send_cast86 = bitcast i64* %send_alloca85 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast86, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i32 35, i8* %0), !reason !5
  %receive87 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 1, i32 36, i8* %0), !reason !5
  %bitcast88 = bitcast i8* %receive87 to double**, !reason !5
  %receive_load89 = load double*, double** %bitcast88, !reason !5
  store double %26, double* %receive_load89, align 8, !tbaa !6, !time !38
  %broadcast = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i64), i32 1, i32 41, i8* %0), !reason !39
  %bitcast98 = bitcast i8* %broadcast to i1*, !reason !39
  %receive_load99 = load i1, i1* %bitcast98, !reason !39
  br i1 %receive_load99, label %l7, label %l6

l7:                                               ; preds = %l6
  %27 = add nuw nsw i64 %new_phi68, 1, !time !32
  %28 = icmp eq i64 %27, 3, !time !33
  %send_alloca100 = alloca i1, !reason !31
  store i1 %28, i1* %send_alloca100, !reason !31
  %send_cast101 = bitcast i1* %send_alloca100 to i8*, !reason !31
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast101, i64 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i64), i32 1, i32 42, i8* %0), !reason !31
  br i1 %28, label %l8, label %l5

l8:                                               ; preds = %l7
  ret void
}

; Function Attrs: nounwind readnone speculatable
declare double @llvm.sqrt.f64(double) #0

define void @multiply_1(i8*) {
entry:
  %argument80 = call i8* bitcast (i8* (i32, i32, i8*)* @receive_argument to i8* (i64, i32, i8*)*)(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 34, i8* %0), !reason !3
  %bitcast81 = bitcast i8* %argument80 to [3 x double]**, !reason !3
  %receive_load82 = load [3 x double]*, [3 x double]** %bitcast81, !reason !3
  %argument72 = call i8* bitcast (i8* (i32, i32, i8*)* @receive_argument to i8* (i64, i32, i8*)*)(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 31, i8* %0), !reason !3
  %bitcast73 = bitcast i8* %argument72 to [3 x double]**, !reason !3
  %receive_load74 = load [3 x double]*, [3 x double]** %bitcast73, !reason !3
  %argument24 = call i8* bitcast (i8* (i32, i32, i8*)* @receive_argument to i8* (i64, i32, i8*)*)(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 10, i8* %0), !reason !3
  %bitcast25 = bitcast i8* %argument24 to [3 x double]**, !reason !3
  %receive_load26 = load [3 x double]*, [3 x double]** %bitcast25, !reason !3
  %argument11 = call i8* bitcast (i8* (i32, i32, i8*)* @receive_argument to i8* (i64, i32, i8*)*)(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 3, i8* %0), !reason !3
  %bitcast12 = bitcast i8* %argument11 to [3 x double]**, !reason !3
  %receive_load13 = load [3 x double]*, [3 x double]** %bitcast12, !reason !3
  %argument = call i8* bitcast (i8* (i32, i32, i8*)* @receive_argument to i8* (i64, i32, i8*)*)(i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 0, i8* %0), !reason !3
  %bitcast = bitcast i8* %argument to [3 x double]**, !reason !3
  %receive_load = load [3 x double]*, [3 x double]** %bitcast, !reason !3
  br label %l

l:                                                ; preds = %l4, %entry
  br label %l1

l1:                                               ; preds = %l3, %l
  %new_phi = phi i64 [ 0, %l ], [ %receive_load89, %l3 ], !time !40
  %receive = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 0, i32 1, i8* %0), !reason !5
  %bitcast9 = bitcast i8* %receive to i64*, !reason !5
  %receive_load10 = load i64, i64* %bitcast9, !reason !5
  %1 = getelementptr inbounds [3 x double], [3 x double]* %receive_load, i64 %receive_load10, i64 %new_phi, !time !33
  %send_alloca = alloca double*, !reason !5
  store double* %1, double** %send_alloca, !reason !5
  %send_cast = bitcast double** %send_alloca to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast, i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 0, i32 2, i8* %0), !reason !5
  %receive14 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 0, i32 4, i8* %0), !reason !5
  %bitcast15 = bitcast i8* %receive14 to i64*, !reason !5
  %receive_load16 = load i64, i64* %bitcast15, !reason !5
  %2 = getelementptr inbounds [3 x double], [3 x double]* %receive_load13, i64 %receive_load16, i64 %new_phi, !time !14
  %send_alloca17 = alloca double*, !reason !5
  store double* %2, double** %send_alloca17, !reason !5
  %send_cast18 = bitcast double** %send_alloca17 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast18, i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 0, i32 5, i8* %0), !reason !5
  %send_alloca19 = alloca i64, !reason !5
  store i64 %new_phi, i64* %send_alloca19, !reason !5
  %send_cast20 = bitcast i64* %send_alloca19 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast20, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 0, i32 7, i8* %0), !reason !5
  br label %l2

l2:                                               ; preds = %l2, %l1
  %new_phi21 = phi i64 [ 0, %l1 ], [ %9, %l2 ], !time !41
  %send_alloca22 = alloca i64, !reason !5
  store i64 %new_phi21, i64* %send_alloca22, !reason !5
  %send_cast23 = bitcast i64* %send_alloca22 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast23, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 0, i32 9, i8* %0), !reason !5
  %3 = getelementptr inbounds [3 x double], [3 x double]* %receive_load26, i64 %new_phi21, i64 %new_phi, !time !42
  %send_alloca27 = alloca double*, !reason !5
  store double* %3, double** %send_alloca27, !reason !5
  %send_cast28 = bitcast double** %send_alloca27 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast28, i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 0, i32 11, i8* %0), !reason !5
  %send_alloca29 = alloca double*, !reason !5
  store double* %1, double** %send_alloca29, !reason !5
  %send_cast30 = bitcast double** %send_alloca29 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast30, i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 0, i32 12, i8* %0), !reason !5
  %send_alloca31 = alloca double*, !reason !5
  store double* %1, double** %send_alloca31, !reason !5
  %send_cast32 = bitcast double** %send_alloca31 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast32, i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 0, i32 13, i8* %0), !reason !5
  %receive33 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (double* getelementptr (double, double* null, i32 1) to i64), i32 0, i32 14, i8* %0), !reason !5
  %bitcast34 = bitcast i8* %receive33 to double*, !reason !5
  %receive_load35 = load double, double* %bitcast34, !reason !5
  %4 = tail call double @llvm.sqrt.f64(double %receive_load35), !time !43
  %send_alloca36 = alloca double*, !reason !5
  store double* %3, double** %send_alloca36, !reason !5
  %send_cast37 = bitcast double** %send_alloca36 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast37, i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 0, i32 15, i8* %0), !reason !5
  %receive38 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (double* getelementptr (double, double* null, i32 1) to i64), i32 0, i32 16, i8* %0), !reason !5
  %bitcast39 = bitcast i8* %receive38 to double*, !reason !5
  %receive_load40 = load double, double* %bitcast39, !reason !5
  %5 = fmul double %4, %receive_load40, !time !44
  %send_alloca41 = alloca double*, !reason !5
  store double* %2, double** %send_alloca41, !reason !5
  %send_cast42 = bitcast double** %send_alloca41 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast42, i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 0, i32 17, i8* %0), !reason !5
  %receive43 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (double* getelementptr (double, double* null, i32 1) to i64), i32 0, i32 18, i8* %0), !reason !5
  %bitcast44 = bitcast i8* %receive43 to double*, !reason !5
  %receive_load45 = load double, double* %bitcast44, !reason !5
  %6 = fadd double %receive_load45, %5, !time !45
  %send_alloca46 = alloca double, !reason !5
  store double %6, double* %send_alloca46, !reason !5
  %send_cast47 = bitcast double* %send_alloca46 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast47, i64 ptrtoint (double* getelementptr (double, double* null, i32 1) to i64), i32 0, i32 19, i8* %0), !reason !5
  %send_alloca48 = alloca double*, !reason !5
  store double* %2, double** %send_alloca48, !reason !5
  %send_cast49 = bitcast double** %send_alloca48 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast49, i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 0, i32 20, i8* %0), !reason !5
  %send_alloca50 = alloca double*, !reason !5
  store double* %3, double** %send_alloca50, !reason !5
  %send_cast51 = bitcast double** %send_alloca50 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast51, i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 0, i32 21, i8* %0), !reason !5
  %receive52 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (double* getelementptr (double, double* null, i32 1) to i64), i32 0, i32 22, i8* %0), !reason !5
  %bitcast53 = bitcast i8* %receive52 to double*, !reason !5
  %receive_load54 = load double, double* %bitcast53, !reason !5
  %7 = tail call double @llvm.sqrt.f64(double %receive_load54), !time !46
  %receive55 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (double* getelementptr (double, double* null, i32 1) to i64), i32 0, i32 23, i8* %0), !reason !5
  %bitcast56 = bitcast i8* %receive55 to double*, !reason !5
  %receive_load57 = load double, double* %bitcast56, !reason !5
  %8 = fmul double %receive_load57, %7, !time !47
  %send_alloca58 = alloca double, !reason !5
  store double %8, double* %send_alloca58, !reason !5
  %send_cast59 = bitcast double* %send_alloca58 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast59, i64 ptrtoint (double* getelementptr (double, double* null, i32 1) to i64), i32 0, i32 24, i8* %0), !reason !5
  %9 = add nuw nsw i64 %new_phi21, 1, !time !36
  %send_alloca60 = alloca i64, !reason !5
  store i64 %9, i64* %send_alloca60, !reason !5
  %send_cast61 = bitcast i64* %send_alloca60 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast61, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 0, i32 25, i8* %0), !reason !5
  %broadcast = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i64), i32 0, i32 38, i8* %0), !reason !39
  %bitcast90 = bitcast i8* %broadcast to i1*, !reason !39
  %receive_load91 = load i1, i1* %bitcast90, !reason !39
  br i1 %receive_load91, label %l3, label %l2

l3:                                               ; preds = %l2
  %send_alloca62 = alloca i64, !reason !5
  store i64 %new_phi, i64* %send_alloca62, !reason !5
  %send_cast63 = bitcast i64* %send_alloca62 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast63, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 0, i32 26, i8* %0), !reason !5
  %repair_phi = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 0, i32 37, i8* %0), !reason !39
  %bitcast88 = bitcast i8* %repair_phi to i64*, !reason !39
  %receive_load89 = load i64, i64* %bitcast88, !reason !39
  %broadcast92 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i64), i32 0, i32 39, i8* %0), !reason !39
  %bitcast93 = bitcast i8* %broadcast92 to i1*, !reason !39
  %receive_load94 = load i1, i1* %bitcast93, !reason !39
  br i1 %receive_load94, label %l4, label %l1

l4:                                               ; preds = %l3
  %broadcast95 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i64), i32 0, i32 40, i8* %0), !reason !39
  %bitcast96 = bitcast i8* %broadcast95 to i1*, !reason !39
  %receive_load97 = load i1, i1* %bitcast96, !reason !39
  br i1 %receive_load97, label %l5, label %l

l5:                                               ; preds = %l7, %l4
  br label %l6

l6:                                               ; preds = %l6, %l5
  %new_phi64 = phi i64 [ 0, %l5 ], [ %13, %l6 ], !time !48
  %receive65 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 0, i32 27, i8* %0), !reason !5
  %bitcast66 = bitcast i8* %receive65 to i64*, !reason !5
  %receive_load67 = load i64, i64* %bitcast66, !reason !5
  %10 = getelementptr inbounds [3 x double], [3 x double]* %receive_load, i64 %receive_load67, i64 %new_phi64, !time !49
  %send_alloca68 = alloca double*, !reason !5
  store double* %10, double** %send_alloca68, !reason !5
  %send_cast69 = bitcast double** %send_alloca68 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast69, i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 0, i32 28, i8* %0), !reason !5
  %send_alloca70 = alloca i64, !reason !5
  store i64 %new_phi64, i64* %send_alloca70, !reason !5
  %send_cast71 = bitcast i64* %send_alloca70 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast71, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 0, i32 30, i8* %0), !reason !5
  %receive75 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 0, i32 32, i8* %0), !reason !5
  %bitcast76 = bitcast i8* %receive75 to i64*, !reason !5
  %receive_load77 = load i64, i64* %bitcast76, !reason !5
  %11 = getelementptr inbounds [3 x double], [3 x double]* %receive_load74, i64 %receive_load77, i64 %new_phi64, !time !42
  %send_alloca78 = alloca double*, !reason !5
  store double* %11, double** %send_alloca78, !reason !5
  %send_cast79 = bitcast double** %send_alloca78 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast79, i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 0, i32 33, i8* %0), !reason !5
  %receive83 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 0, i32 35, i8* %0), !reason !5
  %bitcast84 = bitcast i8* %receive83 to i64*, !reason !5
  %receive_load85 = load i64, i64* %bitcast84, !reason !5
  %12 = getelementptr inbounds [3 x double], [3 x double]* %receive_load82, i64 %receive_load85, i64 %new_phi64, !time !50
  %send_alloca86 = alloca double*, !reason !5
  store double* %12, double** %send_alloca86, !reason !5
  %send_cast87 = bitcast double** %send_alloca86 to i8*, !reason !5
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast87, i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 0, i32 36, i8* %0), !reason !5
  %13 = add nuw nsw i64 %new_phi64, 1, !time !36
  %14 = icmp eq i64 %13, 3, !time !51
  %send_alloca98 = alloca i1, !reason !31
  store i1 %14, i1* %send_alloca98, !reason !31
  %send_cast99 = bitcast i1* %send_alloca98 to i8*, !reason !31
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast99, i64 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i64), i32 0, i32 41, i8* %0), !reason !31
  br i1 %14, label %l7, label %l6

l7:                                               ; preds = %l6
  %broadcast100 = call i8* bitcast (i8* (i32, i32, i32, i8*)* @receive to i8* (i64, i32, i32, i8*)*)(i64 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i64), i32 0, i32 42, i8* %0), !reason !39
  %bitcast101 = bitcast i8* %broadcast100 to i1*, !reason !39
  %receive_load102 = load i1, i1* %bitcast101, !reason !39
  br i1 %receive_load102, label %l8, label %l5

l8:                                               ; preds = %l7
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @multiply([3 x double]* nocapture readonly, [3 x double]* nocapture readonly, [3 x double]* nocapture, [3 x double]* nocapture, [3 x double]* nocapture, [3 x double]* nocapture) local_unnamed_addr #1 {
  br label %7

; <label>:7:                                      ; preds = %41, %6
  %8 = phi i64 [ 0, %6 ], [ %42, %41 ]
  br label %9

; <label>:9:                                      ; preds = %38, %7
  %10 = phi i64 [ 0, %7 ], [ %39, %38 ]
  %11 = getelementptr inbounds [3 x double], [3 x double]* %2, i64 %8, i64 %10
  store double 0.000000e+00, double* %11, align 8, !tbaa !6
  %12 = getelementptr inbounds [3 x double], [3 x double]* %3, i64 %8, i64 %10
  store double 0.000000e+00, double* %12, align 8, !tbaa !6
  %13 = getelementptr inbounds [3 x double], [3 x double]* %4, i64 %8, i64 %10
  store double 0.000000e+00, double* %13, align 8, !tbaa !6
  br label %14

; <label>:14:                                     ; preds = %14, %9
  %15 = phi i64 [ 0, %9 ], [ %36, %14 ]
  %16 = getelementptr inbounds [3 x double], [3 x double]* %0, i64 %8, i64 %15
  %17 = load double, double* %16, align 8, !tbaa !6
  %18 = getelementptr inbounds [3 x double], [3 x double]* %1, i64 %15, i64 %10
  %19 = load double, double* %18, align 8, !tbaa !6
  %20 = fmul double %17, %19
  %21 = tail call double @llvm.sqrt.f64(double %20)
  %22 = load double, double* %11, align 8, !tbaa !6
  %23 = fadd double %22, %21
  store double %23, double* %11, align 8, !tbaa !6
  %24 = load double, double* %16, align 8, !tbaa !6
  %25 = tail call double @llvm.sqrt.f64(double %24)
  %26 = load double, double* %18, align 8, !tbaa !6
  %27 = fmul double %25, %26
  %28 = load double, double* %12, align 8, !tbaa !6
  %29 = fadd double %28, %27
  store double %29, double* %12, align 8, !tbaa !6
  %30 = load double, double* %16, align 8, !tbaa !6
  %31 = load double, double* %18, align 8, !tbaa !6
  %32 = tail call double @llvm.sqrt.f64(double %31)
  %33 = fmul double %30, %32
  %34 = load double, double* %13, align 8, !tbaa !6
  %35 = fadd double %34, %33
  store double %35, double* %13, align 8, !tbaa !6
  %36 = add nuw nsw i64 %15, 1
  %37 = icmp eq i64 %36, 3
  br i1 %37, label %38, label %14

; <label>:38:                                     ; preds = %14
  %39 = add nuw nsw i64 %10, 1
  %40 = icmp eq i64 %39, 3
  br i1 %40, label %41, label %9

; <label>:41:                                     ; preds = %38
  %42 = add nuw nsw i64 %8, 1
  %43 = icmp eq i64 %42, 3
  br i1 %43, label %44, label %7

; <label>:44:                                     ; preds = %59, %41
  %45 = phi i64 [ %60, %59 ], [ 0, %41 ]
  br label %46

; <label>:46:                                     ; preds = %46, %44
  %47 = phi i64 [ 0, %44 ], [ %57, %46 ]
  %48 = getelementptr inbounds [3 x double], [3 x double]* %2, i64 %45, i64 %47
  %49 = load double, double* %48, align 8, !tbaa !6
  %50 = getelementptr inbounds [3 x double], [3 x double]* %3, i64 %45, i64 %47
  %51 = load double, double* %50, align 8, !tbaa !6
  %52 = fadd double %49, %51
  %53 = getelementptr inbounds [3 x double], [3 x double]* %4, i64 %45, i64 %47
  %54 = load double, double* %53, align 8, !tbaa !6
  %55 = fadd double %52, %54
  %56 = getelementptr inbounds [3 x double], [3 x double]* %5, i64 %45, i64 %47
  store double %55, double* %56, align 8, !tbaa !6
  %57 = add nuw nsw i64 %47, 1
  %58 = icmp eq i64 %57, 3
  br i1 %58, label %59, label %46

; <label>:59:                                     ; preds = %46
  %60 = add nuw nsw i64 %45, 1
  %61 = icmp eq i64 %60, 3
  br i1 %61, label %62, label %44

; <label>:62:                                     ; preds = %59
  ret void
}

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32, i8** nocapture readnone) local_unnamed_addr #1 {
  %3 = alloca [3 x [3 x double]], align 16
  %4 = alloca [3 x [3 x double]], align 16
  %5 = alloca [3 x [3 x double]], align 16
  %6 = alloca [3 x [3 x double]], align 16
  %7 = alloca [3 x [3 x double]], align 16
  %8 = alloca [3 x [3 x double]], align 16
  %9 = bitcast [3 x [3 x double]]* %7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %9, i8* align 16 bitcast ([3 x [3 x double]]* @__const.main.a.1 to i8*), i64 72, i1 false)
  %10 = bitcast [3 x [3 x double]]* %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %10, i8* align 16 bitcast ([3 x [3 x double]]* @__const.main.b.2 to i8*), i64 72, i1 false)
  %11 = getelementptr inbounds [3 x [3 x double]], [3 x [3 x double]]* %7, i64 0, i64 0
  %12 = getelementptr inbounds [3 x [3 x double]], [3 x [3 x double]]* %8, i64 0, i64 0
  %13 = getelementptr inbounds [3 x [3 x double]], [3 x [3 x double]]* %3, i64 0, i64 0
  %14 = getelementptr inbounds [3 x [3 x double]], [3 x [3 x double]]* %4, i64 0, i64 0
  %15 = getelementptr inbounds [3 x [3 x double]], [3 x [3 x double]]* %5, i64 0, i64 0
  %16 = getelementptr inbounds [3 x [3 x double]], [3 x [3 x double]]* %6, i64 0, i64 0
  call void @replace_multiply([3 x double]* nonnull %11, [3 x double]* nonnull %12, [3 x double]* nonnull %13, [3 x double]* nonnull %14, [3 x double]* nonnull %15, [3 x double]* nonnull %16)
  br label %17

; <label>:17:                                     ; preds = %26, %2
  %18 = phi i64 [ 0, %2 ], [ %28, %26 ]
  br label %19

; <label>:19:                                     ; preds = %19, %17
  %20 = phi i64 [ 0, %17 ], [ %24, %19 ]
  %21 = getelementptr inbounds [3 x [3 x double]], [3 x [3 x double]]* %6, i64 0, i64 %18, i64 %20
  %22 = load double, double* %21, align 8, !tbaa !6
  %23 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), double %22)
  %24 = add nuw nsw i64 %20, 1
  %25 = icmp eq i64 %24, 3
  br i1 %25, label %26, label %19

; <label>:26:                                     ; preds = %19
  %27 = tail call i32 @putchar(i32 10)
  %28 = add nuw nsw i64 %18, 1
  %29 = icmp eq i64 %28, 3
  br i1 %29, label %30, label %17

; <label>:30:                                     ; preds = %26
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #2

define void @replace_multiply([3 x double]*, [3 x double]*, [3 x double]*, [3 x double]*, [3 x double]*, [3 x double]*) {
entry:
  %6 = call i8* @init()
  %call_partitioned_functions = call i8* @call_partitioned_functions(i32 2, void (i8*)** getelementptr inbounds ([2 x void (i8*)*], [2 x void (i8*)*]* @funs, i32 0, i32 0), i8* %6)
  %send_alloca = alloca [3 x double]*, !reason !3
  store [3 x double]* %2, [3 x double]** %send_alloca, !reason !3
  %send_cast = bitcast [3 x double]** %send_alloca to i8*, !reason !3
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send_argument to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast, i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 1, i32 0, i8* %6), !reason !3
  %send_alloca1 = alloca [3 x double]*, !reason !3
  store [3 x double]* %3, [3 x double]** %send_alloca1, !reason !3
  %send_cast2 = bitcast [3 x double]** %send_alloca1 to i8*, !reason !3
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send_argument to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast2, i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 1, i32 3, i8* %6), !reason !3
  %send_alloca3 = alloca [3 x double]*, !reason !3
  store [3 x double]* %4, [3 x double]** %send_alloca3, !reason !3
  %send_cast4 = bitcast [3 x double]** %send_alloca3 to i8*, !reason !3
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send_argument to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast4, i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 0, i32 6, i8* %6), !reason !3
  %send_alloca5 = alloca [3 x double]*, !reason !3
  store [3 x double]* %0, [3 x double]** %send_alloca5, !reason !3
  %send_cast6 = bitcast [3 x double]** %send_alloca5 to i8*, !reason !3
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send_argument to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast6, i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 0, i32 8, i8* %6), !reason !3
  %send_alloca7 = alloca [3 x double]*, !reason !3
  store [3 x double]* %1, [3 x double]** %send_alloca7, !reason !3
  %send_cast8 = bitcast [3 x double]** %send_alloca7 to i8*, !reason !3
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send_argument to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast8, i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 1, i32 10, i8* %6), !reason !3
  %send_alloca9 = alloca [3 x double]*, !reason !3
  store [3 x double]* %3, [3 x double]** %send_alloca9, !reason !3
  %send_cast10 = bitcast [3 x double]** %send_alloca9 to i8*, !reason !3
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send_argument to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast10, i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 0, i32 29, i8* %6), !reason !3
  %send_alloca11 = alloca [3 x double]*, !reason !3
  store [3 x double]* %4, [3 x double]** %send_alloca11, !reason !3
  %send_cast12 = bitcast [3 x double]** %send_alloca11 to i8*, !reason !3
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send_argument to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast12, i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 1, i32 31, i8* %6), !reason !3
  %send_alloca13 = alloca [3 x double]*, !reason !3
  store [3 x double]* %5, [3 x double]** %send_alloca13, !reason !3
  %send_cast14 = bitcast [3 x double]** %send_alloca13 to i8*, !reason !3
  call void bitcast (void (i8*, i32, i32, i32, i8*)* @send_argument to void (i8*, i64, i32, i32, i8*)*)(i8* %send_cast14, i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i32 1, i32 34, i8* %6), !reason !3
  call void @join_partitioned_functions(i32 2, i8* %call_partitioned_functions)
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @putchar(i32) local_unnamed_addr #4

; Function Attrs: nounwind ssp uwtable
define i8* @init() #1 {
  %1 = tail call i8* @malloc(i64 208) #8
  %2 = bitcast i8* %1 to %struct.Comm**
  store %struct.Comm* null, %struct.Comm** %2, align 8, !tbaa !52
  %3 = getelementptr inbounds i8, i8* %1, i64 8
  %4 = bitcast i8* %3 to %struct._opaque_pthread_rwlock_t*
  %5 = tail call i32 @"\01_pthread_rwlock_init"(%struct._opaque_pthread_rwlock_t* nonnull %4, %struct._opaque_pthread_rwlockattr_t* null) #4
  ret i8* %1
}

; Function Attrs: nounwind allocsize(0)
declare noalias i8* @malloc(i64) local_unnamed_addr #5

declare i32 @"\01_pthread_rwlock_init"(%struct._opaque_pthread_rwlock_t*, %struct._opaque_pthread_rwlockattr_t*) local_unnamed_addr #6

; Function Attrs: nounwind ssp uwtable
define noalias i8* @_call_function(i8* nocapture readonly) #1 {
  %2 = bitcast i8* %0 to void (%struct.Context*)**
  %3 = load void (%struct.Context*)*, void (%struct.Context*)** %2, align 8, !tbaa !57
  %4 = getelementptr inbounds i8, i8* %0, i64 8
  %5 = bitcast i8* %4 to %struct.Context**
  %6 = load %struct.Context*, %struct.Context** %5, align 8, !tbaa !59
  tail call void %3(%struct.Context* %6) #4
  ret i8* null
}

; Function Attrs: nounwind ssp uwtable
define i8* @call_partitioned_functions(i32, void (i8*)** nocapture readonly, i8*) #1 {
  %4 = sext i32 %0 to i64
  %5 = shl nsw i64 %4, 3
  %6 = tail call i8* @malloc(i64 %5) #8
  %7 = bitcast i8* %6 to %struct._opaque_pthread_t**
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %9, label %24

; <label>:9:                                      ; preds = %3
  %10 = zext i32 %0 to i64
  br label %11

; <label>:11:                                     ; preds = %11, %9
  %12 = phi i64 [ 0, %9 ], [ %22, %11 ]
  %13 = tail call i8* @malloc(i64 16) #8
  %14 = getelementptr inbounds void (i8*)*, void (i8*)** %1, i64 %12
  %15 = bitcast void (i8*)** %14 to i64*
  %16 = load i64, i64* %15, align 8, !tbaa !60
  %17 = bitcast i8* %13 to i64*
  store i64 %16, i64* %17, align 8, !tbaa !57
  %18 = getelementptr inbounds i8, i8* %13, i64 8
  %19 = bitcast i8* %18 to i8**
  store i8* %2, i8** %19, align 8, !tbaa !59
  %20 = getelementptr inbounds %struct._opaque_pthread_t*, %struct._opaque_pthread_t** %7, i64 %12
  %21 = tail call i32 @pthread_create(%struct._opaque_pthread_t** %20, %struct._opaque_pthread_attr_t* null, i8* (i8*)* nonnull @_call_function, i8* %13) #4
  %22 = add nuw nsw i64 %12, 1
  %23 = icmp eq i64 %22, %10
  br i1 %23, label %24, label %11

; <label>:24:                                     ; preds = %11, %3
  ret i8* %6
}

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
  %10 = load %struct._opaque_pthread_t*, %struct._opaque_pthread_t** %9, align 8, !tbaa !60
  %11 = tail call i32 @"\01_pthread_join"(%struct._opaque_pthread_t* %10, i8** null) #4
  %12 = add nuw nsw i64 %8, 1
  %13 = icmp eq i64 %12, %6
  br i1 %13, label %14, label %7

; <label>:14:                                     ; preds = %7, %2
  ret void
}

declare i32 @"\01_pthread_join"(%struct._opaque_pthread_t*, i8**) local_unnamed_addr #6

; Function Attrs: nounwind ssp uwtable
define void @_add_channel(i8*, i32, i32, %struct.Context* nocapture) local_unnamed_addr #1 {
  %5 = tail call i8* @malloc(i64 24) #8
  %6 = bitcast i8* %5 to i32*
  store i32 %2, i32* %6, align 8, !tbaa !61
  %7 = getelementptr inbounds i8, i8* %5, i64 4
  %8 = bitcast i8* %7 to i32*
  store i32 %1, i32* %8, align 4, !tbaa !64
  %9 = sext i32 %1 to i64
  %10 = tail call i8* @malloc(i64 %9) #8
  %11 = getelementptr inbounds i8, i8* %5, i64 8
  %12 = bitcast i8* %11 to i8**
  store i8* %10, i8** %12, align 8, !tbaa !65
  %13 = tail call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true)
  %14 = tail call i8* @__memcpy_chk(i8* %10, i8* %0, i64 %9, i64 %13) #4
  %15 = getelementptr inbounds i8, i8* %5, i64 16
  %16 = bitcast i8* %15 to %struct.Comm**
  store %struct.Comm* null, %struct.Comm** %16, align 8, !tbaa !66
  %17 = getelementptr inbounds %struct.Context, %struct.Context* %3, i64 0, i32 0
  %18 = load %struct.Comm*, %struct.Comm** %17, align 8, !tbaa !52
  %19 = icmp eq %struct.Comm* %18, null
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %4
  %21 = bitcast %struct.Context* %3 to i8**
  br label %30

; <label>:22:                                     ; preds = %22, %4
  %23 = phi %struct.Comm* [ %25, %22 ], [ %18, %4 ]
  %24 = getelementptr inbounds %struct.Comm, %struct.Comm* %23, i64 0, i32 3
  %25 = load %struct.Comm*, %struct.Comm** %24, align 8, !tbaa !66
  %26 = icmp eq %struct.Comm* %25, null
  br i1 %26, label %27, label %22

; <label>:27:                                     ; preds = %22
  %28 = getelementptr inbounds %struct.Comm, %struct.Comm* %23, i64 0, i32 3
  %29 = bitcast %struct.Comm** %28 to i8**
  br label %30

; <label>:30:                                     ; preds = %27, %20
  %31 = phi i8** [ %29, %27 ], [ %21, %20 ]
  store i8* %5, i8** %31, align 8, !tbaa !60
  ret void
}

; Function Attrs: nounwind readnone speculatable
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1, i1) #0

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8*, i8*, i64, i64) local_unnamed_addr #3

; Function Attrs: norecurse nounwind ssp uwtable
define %struct.Comm* @_find_channel(i1 zeroext, i32, %struct.Context* nocapture) local_unnamed_addr #7 {
  %4 = getelementptr inbounds %struct.Context, %struct.Context* %2, i64 0, i32 0
  %5 = load %struct.Comm*, %struct.Comm** %4, align 8, !tbaa !60
  %6 = icmp eq %struct.Comm* %5, null
  br i1 %6, label %33, label %7

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.Comm, %struct.Comm* %5, i64 0, i32 0
  %9 = load i32, i32* %8, align 8, !tbaa !61
  %10 = icmp eq i32 %9, %1
  br i1 %10, label %15, label %28

; <label>:11:                                     ; preds = %28
  %12 = getelementptr inbounds %struct.Comm, %struct.Comm* %31, i64 0, i32 0
  %13 = load i32, i32* %12, align 8, !tbaa !61
  %14 = icmp eq i32 %13, %1
  br i1 %14, label %15, label %28

; <label>:15:                                     ; preds = %11, %7
  %16 = phi %struct.Comm* [ %5, %7 ], [ %31, %11 ]
  %17 = phi %struct.Comm* [ null, %7 ], [ %29, %11 ]
  br i1 %0, label %18, label %33

; <label>:18:                                     ; preds = %15
  %19 = icmp eq %struct.Comm* %17, null
  %20 = getelementptr inbounds %struct.Comm, %struct.Comm* %16, i64 0, i32 3
  %21 = bitcast %struct.Comm** %20 to i64*
  %22 = load i64, i64* %21, align 8, !tbaa !66
  br i1 %19, label %26, label %23

; <label>:23:                                     ; preds = %18
  %24 = getelementptr inbounds %struct.Comm, %struct.Comm* %17, i64 0, i32 3
  %25 = bitcast %struct.Comm** %24 to i64*
  store i64 %22, i64* %25, align 8, !tbaa !66
  br label %33

; <label>:26:                                     ; preds = %18
  %27 = bitcast %struct.Context* %2 to i64*
  store i64 %22, i64* %27, align 8, !tbaa !52
  br label %33

; <label>:28:                                     ; preds = %11, %7
  %29 = phi %struct.Comm* [ %31, %11 ], [ %5, %7 ]
  %30 = getelementptr inbounds %struct.Comm, %struct.Comm* %29, i64 0, i32 3
  %31 = load %struct.Comm*, %struct.Comm** %30, align 8, !tbaa !60
  %32 = icmp eq %struct.Comm* %31, null
  br i1 %32, label %33, label %11

; <label>:33:                                     ; preds = %28, %26, %23, %15, %3
  %34 = phi %struct.Comm* [ %16, %15 ], [ %16, %26 ], [ %16, %23 ], [ null, %3 ], [ null, %28 ]
  ret %struct.Comm* %34
}

; Function Attrs: nounwind ssp uwtable
define void @send(i8*, i32, i32, i32, i8*) #1 {
  %6 = bitcast i8* %4 to %struct.Context*
  %7 = getelementptr inbounds i8, i8* %4, i64 8
  %8 = bitcast i8* %7 to %struct._opaque_pthread_rwlock_t*
  %9 = tail call i32 @"\01_pthread_rwlock_wrlock"(%struct._opaque_pthread_rwlock_t* nonnull %8) #4
  tail call void @_add_channel(i8* %0, i32 %1, i32 %3, %struct.Context* %6)
  %10 = tail call i32 @"\01_pthread_rwlock_unlock"(%struct._opaque_pthread_rwlock_t* nonnull %8) #4
  ret void
}

declare i32 @"\01_pthread_rwlock_wrlock"(%struct._opaque_pthread_rwlock_t*) local_unnamed_addr #6

declare i32 @"\01_pthread_rwlock_unlock"(%struct._opaque_pthread_rwlock_t*) local_unnamed_addr #6

; Function Attrs: nounwind ssp uwtable
define i8* @_receive(i1 zeroext, i32, i32, i8*) local_unnamed_addr #1 {
  %5 = bitcast i8* %3 to %struct.Context*
  %6 = getelementptr inbounds i8, i8* %3, i64 8
  %7 = bitcast i8* %6 to %struct._opaque_pthread_rwlock_t*
  br label %8

; <label>:8:                                      ; preds = %13, %4
  br i1 %0, label %9, label %11

; <label>:9:                                      ; preds = %8
  %10 = tail call i32 @"\01_pthread_rwlock_wrlock"(%struct._opaque_pthread_rwlock_t* nonnull %7) #4
  br label %13

; <label>:11:                                     ; preds = %8
  %12 = tail call i32 @"\01_pthread_rwlock_rdlock"(%struct._opaque_pthread_rwlock_t* nonnull %7) #4
  br label %13

; <label>:13:                                     ; preds = %11, %9
  %14 = tail call %struct.Comm* @_find_channel(i1 zeroext %0, i32 %2, %struct.Context* %5)
  %15 = tail call i32 @"\01_pthread_rwlock_unlock"(%struct._opaque_pthread_rwlock_t* nonnull %7) #4
  %16 = icmp eq %struct.Comm* %14, null
  br i1 %16, label %8, label %17

; <label>:17:                                     ; preds = %13
  %18 = getelementptr inbounds %struct.Comm, %struct.Comm* %14, i64 0, i32 1
  %19 = load i32, i32* %18, align 4, !tbaa !64
  %20 = icmp eq i32 %19, %1
  br i1 %20, label %23, label %21

; <label>:21:                                     ; preds = %17
  %22 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.12, i64 0, i64 0), i32 %2, i32 %1, i32 %19)
  br label %23

; <label>:23:                                     ; preds = %21, %17
  %24 = getelementptr inbounds %struct.Comm, %struct.Comm* %14, i64 0, i32 2
  %25 = load i8*, i8** %24, align 8, !tbaa !65
  ret i8* %25
}

declare i32 @"\01_pthread_rwlock_rdlock"(%struct._opaque_pthread_rwlock_t*) local_unnamed_addr #6

; Function Attrs: nounwind ssp uwtable
define i8* @receive(i32, i32, i32, i8*) #1 {
  %5 = tail call i8* @_receive(i1 zeroext true, i32 %0, i32 %2, i8* %3)
  ret i8* %5
}

; Function Attrs: nounwind ssp uwtable
define void @send_argument(i8*, i32, i32, i32, i8*) #1 {
  tail call void @send(i8* %0, i32 %1, i32 undef, i32 %3, i8* %4)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define i8* @receive_argument(i32, i32, i8*) #1 {
  %4 = tail call i8* @_receive(i1 zeroext false, i32 %0, i32 %1, i8* %2)
  ret i8* %4
}

; Function Attrs: nounwind ssp uwtable
define void @send_return(i8*, i32, i8*) local_unnamed_addr #1 {
  tail call void @send(i8* %0, i32 %1, i32 undef, i32 -1, i8* %2)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define i8* @receive_return(i32, i8*) local_unnamed_addr #1 {
  %3 = tail call i8* @_receive(i1 zeroext true, i32 %0, i32 -1, i8* %1)
  ret i8* %3
}

; Function Attrs: nounwind ssp uwtable
define void @send_token(i32, i32, i8*) local_unnamed_addr #1 {
  tail call void @send(i8* null, i32 0, i32 undef, i32 %1, i8* %2)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @receive_token(i32, i8*) local_unnamed_addr #1 {
  %3 = tail call i8* @_receive(i1 zeroext true, i32 0, i32 %0, i8* %1)
  ret void
}

attributes #0 = { nounwind readnone speculatable }
attributes #1 = { nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { norecurse nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { allocsize(0) }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2}

!0 = !{!"clang version 8.0.0 (tags/RELEASE_800/final)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!"replace argument"}
!4 = !{!"0", !"0"}
!5 = !{!"replace mapped op"}
!6 = !{!7, !7, i64 0}
!7 = !{!"double", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"8", !"9"}
!11 = !{!"10", !"11"}
!12 = !{!"4", !"7"}
!13 = !{!"7", !"8"}
!14 = !{!"6", !"9"}
!15 = !{!"13", !"14"}
!16 = !{!"14", !"19"}
!17 = !{!"20", !"27"}
!18 = !{!"0", !"1"}
!19 = !{!"31", !"34"}
!20 = !{!"40", !"41"}
!21 = !{!"9", !"10"}
!22 = !{!"11", !"12"}
!23 = !{!"5", !"6"}
!24 = !{!"39", !"40"}
!25 = !{!"19", !"20"}
!26 = !{!"12", !"13"}
!27 = !{!"30", !"31"}
!28 = !{!"34", !"37"}
!29 = !{!"38", !"39"}
!30 = !{!"27", !"30"}
!31 = !{!"broadcast"}
!32 = !{!"0", !"3"}
!33 = !{!"3", !"6"}
!34 = !{!"repair_phi"}
!35 = !{!"6", !"7"}
!36 = !{!"8", !"11"}
!37 = !{!"12", !"15"}
!38 = !{!"15", !"16"}
!39 = !{!"receive"}
!40 = !{!"3", !"3"}
!41 = !{!"5", !"5"}
!42 = !{!"5", !"8"}
!43 = !{!"11", !"18"}
!44 = !{!"30", !"35"}
!45 = !{!"35", !"38"}
!46 = !{!"18", !"25"}
!47 = !{!"25", !"30"}
!48 = !{!"2", !"2"}
!49 = !{!"2", !"5"}
!50 = !{!"11", !"14"}
!51 = !{!"14", !"17"}
!52 = !{!53, !54, i64 0}
!53 = !{!"Context", !54, i64 0, !55, i64 8}
!54 = !{!"any pointer", !8, i64 0}
!55 = !{!"_opaque_pthread_rwlock_t", !56, i64 0, !8, i64 8}
!56 = !{!"long", !8, i64 0}
!57 = !{!58, !54, i64 0}
!58 = !{!"Closure", !54, i64 0, !54, i64 8}
!59 = !{!58, !54, i64 8}
!60 = !{!54, !54, i64 0}
!61 = !{!62, !63, i64 0}
!62 = !{!"Comm", !63, i64 0, !63, i64 4, !54, i64 8, !54, i64 16}
!63 = !{!"int", !8, i64 0}
!64 = !{!62, !63, i64 4}
!65 = !{!62, !54, i64 8}
!66 = !{!62, !54, i64 16}
