BEGIN{
  print "(label :class \"list-label\" :text \"" list_name "\")";
}
{
  if(NF == 0){
    next
  }
  content=$4;
  for(i=5;i<=NF;i++){
    content=content " " $i
  };
  print "(button :onclick \"scripts/todos_script --edit " $3 "\" (label :class \"todo-item\" :halign \"start\" :text \"" content "\"))"
}
