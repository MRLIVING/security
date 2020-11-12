##
# usage:
#     cat access.log | egrep --color '2020:14:(0[0-9]|10])'  | awk -f topIP.awk
##

BEGIN {
    PROCINFO["sorted_in"]="@val_num_desc";
}

{
    cnt++;

    ips[$1]++;
    dts[ substr($4,2,17) ]++;
    urls[$7]++;
}

END {
    N = 10;
    i = 0;
    for (ip in ips) {
        print ip, ips[ip];

        if (N <= ++i) break;
    }

    i = 0;
    for (url in urls) {
        print url, urls[url];

        if (N <= ++i) break;
    }

    i = 0;
    for (dt in dts) {
        print dt, dts[dt];

        if (N <= ++i) break;
    }

}
