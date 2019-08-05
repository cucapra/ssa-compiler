; ModuleID = '<stdin>'
source_filename = "tests/quadratic.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

@.str.1 = private unnamed_addr constant [22 x i8] c"quadratic result: %f\0A\00", align 1
@str = private unnamed_addr constant [14 x i8] c"starting main\00", align 1

; Function Attrs: nounwind ssp uwtable
define double @quadratic(double, double, double) local_unnamed_addr #0 {
  %4 = fmul double %1, %1, !partition !3, !start !4, !end !5
  %5 = fmul double %0, 4.000000e+00, !partition !3, !start !3, !end !4
  %6 = fmul double %5, %2, !partition !6, !start !7, !end !8
  %7 = fsub double %4, %6, !partition !6, !start !9, !end !10
  %8 = fmul double %0, 2.000000e+00, !partition !3, !start !11, !end !12
  %9 = tail call i32 @"\01_sleep"(i32 1) #5, !partition !3, !start !13, !end !14
  %10 = tail call i32 @"\01_sleep"(i32 1) #5, !partition !6, !start !15, !end !16
  %11 = tail call i32 @"\01_sleep"(i32 1) #5, !partition !6, !start !16, !end !17
  %12 = tail call i32 @"\01_sleep"(i32 1) #5, !partition !3, !start !18, !end !19
  %13 = tail call i32 @"\01_sleep"(i32 1) #5, !partition !6, !start !3, !end !7
  %14 = tail call i32 @"\01_sleep"(i32 1) #5, !partition !6, !start !20, !end !13
  %15 = tail call i32 @"\01_sleep"(i32 1) #5, !partition !3, !start !5, !end !18
  %16 = tail call i32 @"\01_sleep"(i32 1) #5, !partition !3, !start !19, !end !11
  %17 = fsub double -0.000000e+00, %1, !partition !6, !start !21, !end !20
  %18 = tail call double @llvm.sqrt.f64(double %7), !partition !6, !start !22, !end !21
  %19 = fsub double %18, %1, !partition !3, !start !12, !end !13
  %20 = fdiv double %19, %8, !partition !6, !start !23, !end !15
  %21 = fsub double %17, %18, !partition !6, !start !13, !end !23
  %22 = fdiv double %21, %8, !partition !3, !start !14, !end !24
  %23 = fcmp une double %20, 0.000000e+00, !partition !3, !start !24, !end !25
  %24 = select i1 %23, double %20, double %22, !partition !3, !start !16, !end !26
  ret double %24, !partition !3, !start !27, !end !17
}

declare i32 @"\01_sleep"(i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable
declare double @llvm.sqrt.f64(double) #2

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i32 @puts(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @str, i64 0, i64 0))
  %4 = getelementptr inbounds i8*, i8** %1, i64 1
  %5 = load i8*, i8** %4, align 8, !tbaa !28
  %6 = tail call i32 @atoi(i8* %5)
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds i8*, i8** %1, i64 2
  %9 = load i8*, i8** %8, align 8, !tbaa !28
  %10 = tail call i32 @atoi(i8* %9)
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds i8*, i8** %1, i64 3
  %13 = load i8*, i8** %12, align 8, !tbaa !28
  %14 = tail call i32 @atoi(i8* %13)
  %15 = sitofp i32 %14 to double
  %16 = tail call double @quadratic(double %7, double %11, double %15)
  %17 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), double %16)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind readonly
declare i32 @atoi(i8* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #5

attributes #0 = { nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 8.0.0 (tags/RELEASE_800/final)"}
!3 = !{!"0"}
!4 = !{!"2"}
!5 = !{!"4"}
!6 = !{!"1"}
!7 = !{!"3"}
!8 = !{!"5"}
!9 = !{!"6"}
!10 = !{!"8"}
!11 = !{!"13"}
!12 = !{!"15"}
!13 = !{!"17"}
!14 = !{!"20"}
!15 = !{!"22"}
!16 = !{!"25"}
!17 = !{!"28"}
!18 = !{!"7"}
!19 = !{!"10"}
!20 = !{!"14"}
!21 = !{!"12"}
!22 = !{!"9"}
!23 = !{!"19"}
!24 = !{!"23"}
!25 = !{!"24"}
!26 = !{!"26"}
!27 = !{!"27"}
!28 = !{!29, !29, i64 0}
!29 = !{!"any pointer", !30, i64 0}
!30 = !{!"omnipotent char", !31, i64 0}
!31 = !{!"Simple C/C++ TBAA"}
