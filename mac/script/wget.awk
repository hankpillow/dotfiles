BEGIN {
  Index = 0
  print "# wget report filter"
  print "# report column pattern:"
  print "# {1 Http-Status} {2 Url} {3 Location} {4 Content-Length} {5 Expires} {6 Last-Modified} {7 X-Cache} {8 X-Drupal-Cache}"
}

/^--[[:digit:]]{4}/ {
  Index++
  Pages[Index,1] = "!" # status code
  Pages[Index,2] = $3 # url
  Pages[Index,3] = "-" # redirect location
  Pages[Index,4] = "-" # content-length
  Pages[Index,5] = "-" # expires data
  Pages[Index,6] = "-" # expires data
  Pages[Index,7] = "-" # x-cache
  Pages[Index,8] = "-" # x-cache
}

/[[:blank:]]HTTP\/[[:digit:]]/ {
  Pages[Index,1] = $2
}

/[[:blank:]]X-Drupal-Cache:/ {
  Pages[Index,8] = $2
}

/[[:blank:]]X-Cache:/ {
  Pages[Index,7] = $2
}

/[[:blank:]]Location/ {
  Pages[Index,3] = $2
}

/^Length:[[:blank:]][[:digit:]]/ {
  Pages[Index,4] = $2
}

/[[:blank:]]Last-Modified:/ {
  date = $0
  sub(/[[:blank:]]+Last-Modified:[[:blank:]]+/, "", date)
  gsub(/[[:blank:]]/, "_", date)
  Pages[Index,6] = date
}

/[[:blank:]]Expires:/ {
  date = $0
  sub(/[[:blank:]]+Expires:[[:blank:]]+/, "", date)
  gsub(/[[:blank:]]/, "_", date)
  Pages[Index,5] = date
}

END  {
  for (i = 0; i <= Index; i++)
    print Pages[i,1],Pages[i,2],Pages[i,3],Pages[i,4],Pages[i,5],Pages[i,6],Pages[i,7],Pages[i,8]

}
