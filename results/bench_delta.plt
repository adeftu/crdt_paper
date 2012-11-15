reset
set datafile separator ","
# set title "Delta-based synchronization"
set xlabel "Number of elements in the SOR-Set"

set yrange [0:10]

set xtics ("1M" 0, "5M" 5000000, "10M" 10000000, "15M" 15000000, "20M" 20000000, "25M" 25000000) nomirror out scale 1

set ylabel "Average merge time (s) for 1M updates"
set key top right noautotitle
set terminal pdf enhanced color solid
set output "bench_delta.pdf"

set style data histogram
set style histogram rowstacked
set style fill solid border -1
set boxwidth 0.55

plot 'bench_delta.csv' every 3::1 using ($11/1000) linecolor rgb "#62b462" title "Get ids",\
     'bench_delta.csv' every 3::1 using ($12/1000) linecolor rgb "#ff7f2a" title "Get update elements",\
     'bench_delta.csv' every 3::1 using ($13/1000):xtic(gprintf("%.0fM", $1/1000000)) linecolor rgb "#6aa5df" title "Add updates"

set output
reset