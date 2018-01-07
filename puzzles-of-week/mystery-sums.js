(() => {
let expression = readline();

let [left_expr, right_expr] = expression.split(' = ');
let arr_q = expression.match(/\?/g);
if (arr_q == null) { print(expression); return; }

let compute = (op, n1, n2) => {
    n1 = Number(n1);
    n2 = Number(n2);
    switch(op) {
        case '+': return n1 + n2;
        case '-': return n1 - n2;
        case '*': return n1 * n2;
        case '/': return n1 / n2;
    }
};

let max_combination = 10 ** arr_q.length;
for (let x=0;x<max_combination;x++) {
    let str_comb = '' + x;
    while ((str_comb).length < arr_q.length ) { str_comb = '0' + str_comb; }
    
    let t_str = left_expr;
    let arr_comb = str_comb.split('');
    arr_q.forEach((v, k) => t_str = t_str.replace(v, arr_comb[k]) );

    let arr_val = t_str.match(/\d+/g);
    let left_val = Number(arr_val[0]);
    left_expr
        .match(/(\+)|(-)|(\*)|(\/)/g)
        .forEach((op, k) => left_val = compute(op, left_val, arr_val[k+1]) );

    if (left_val == right_expr){
        print(t_str + ' = ' + left_val)
        break;
    }
}

})();
