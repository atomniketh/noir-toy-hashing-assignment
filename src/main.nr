use dep::std;
use dep::u2b;

global PRIME: u32 = 16777619;

// fn main(value: u32, hash_value: pub u32){
//     let calculated_hash_value = calculate_hash(value);

//     assert(calculated_hash_value == hash_value);
// }

// fn calculate_hash(num: u32) -> u32 {
//     let thisField = 2;
//     let size = thisField.pow_32(32);
//     let mut hash_value = 2166136261;
//     let primeNum = 16777619;

//     let num_field: Field = (num as Field);
//     let num_bytes = num_field.to_be_bytes(32);

//     for byte in num_bytes {
//         let product = (hash_value * primeNum) % size;
//         let product_field: Field = product;
//         let product_u8 = (product_field as u8);
//         let hash_value = (product_u8 ^ byte);
//         std::println(hash_value);
//     };

//     hash_value
// }


fn main(x: u32) { 
    calculate_hash(x);
}

fn calculate_hash(num: u32) -> u32 { 
    let thisField = 2;
    let size = thisField.pow_32(32);
    let mut hash_value = 2166136261;
    let primeNum = 16777619;
    // let num_field: Field = (num as Field);
    // let num_bytes = num_field.to_be_bytes(32);
    let num_array = u2b::u32_to_u8(num);
    
    for byte in num_array { 
        let product = (hash_value * primeNum) % size;
        let product_field: Field = product;
        let product_u8 = (product_field as u8);
        let hash_value = (product_u8 ^ byte);
            std::println(hash_value);
     };

    hash_value as u32
 }


#[test]
fn test_1() {
    let num1 = 127561628;
    let num: u32 = num1;
    std::println(num);
    let hash = calculate_hash(num);
    std::println(hash);
    assert(hash == 0x71233de7);
}

#[test]
fn test_2() {
    let num1 = 237261828;
    let num: u32 = num1;
    let hash = calculate_hash(num);

    assert(hash == 0x7F51D567);
}

#[test]
fn test_3() {
    let num1 = 596214892;
    let num: u32 = num1;
    let hash = calculate_hash(num);

    assert(hash == 0x3F0C8995);
}
