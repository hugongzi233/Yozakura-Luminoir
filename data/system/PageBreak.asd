@loadcell
@loop
;
@macro name=copyone
@copy dx=0 dy=0 sx=%x sy=0 sw=40 sh=22
@wait time=33
@endmacro
;
*start

@copyone x=0
@wait time=500
@copyone x=40
@copyone x=80
@copyone x=120
@copyone x=160
@wait time=50
@copyone x=120
@copyone x=80
@copyone x=40

@jump target=*start