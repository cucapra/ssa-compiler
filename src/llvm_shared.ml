open Llvm

let include_function fn =
  let name = value_name fn in
  not ((is_declaration fn) || (name = "main") || (Core.String.is_prefix name ~prefix:"replace_"))

let iter_included_functions (f : llvalue -> unit) (md : llmodule) =
  iter_functions (fun fn -> if include_function fn then f fn) md

let rec print_type llty : string =
  let ty = classify_type llty in
  match ty with
  | TypeKind.Void -> "  void\n"
  | TypeKind.Half -> "  half\n"
  | TypeKind.Float -> "  float\n"
  | TypeKind.Double -> "  double\n"
  | TypeKind.X86fp80 -> "  X86fp80\n"
  | TypeKind.Fp128 -> "  Fp128\n"
  | TypeKind.Ppc_fp128 -> "  Ppc_fp128\n"
  | TypeKind.Label -> "  Label\n"
  | TypeKind.Struct -> "  Struct\n"
  | TypeKind.Integer -> "  integer\n"
  | TypeKind.Function -> "  function\n"
  | TypeKind.Array -> "  array of" ^ (print_type (element_type llty))
  | TypeKind.Pointer  -> "  pointer to" ^ (print_type (element_type llty))
  | TypeKind.Vector -> "  vector of" ^ (print_type (element_type llty))
  | TypeKind.Metadata -> "  Metadata\n"
  | TypeKind.X86_mmx -> "  X86_mmx\n"
  | TypeKind.Token -> "  Token\n"

let opcode_cost (opcode : Opcode.t) : int =
  match opcode with
  | Alloca -> 1
  | Load -> 1
  | Store -> 1
  | FMul -> 5
  | FSub -> 3
  | FDiv -> 7
  | FAdd -> 3
  | FCmp -> 1
  | PHI -> 0
  | Ret -> 1
  | Call -> 15
  | Br -> 1
  | Select -> 1
  | _ -> 7

let pretty_opcode (opcode : Opcode.t) : string =
  match opcode with
  | Invalid -> "invalid"
  | Ret -> "ret"
  | Br -> "br"
  | Switch -> "switch"
  | IndirectBr -> "indirectbr"
  | Invoke -> "invoke"
  | Invalid2 -> "invalid2"
  | Unreachable -> "unreachable"
  | Add -> "add"
  | FAdd -> "fadd"
  | Sub -> "sub"
  | FSub -> "fsub"
  | Mul -> "mul"
  | FMul -> "fmul"
  | UDiv -> "udiv"
  | SDiv -> "sdiv"
  | FDiv -> "fdiv"
  | URem -> "urem"
  | SRem -> "srem"
  | FRem -> "frem"
  | Shl -> "shl"
  | LShr -> "lshr"
  | AShr -> "ashr"
  | And -> "and"
  | Or -> "or"
  | Xor -> "xor"
  | Alloca -> "alloca"
  | Load -> "load"
  | Store -> "store"
  | GetElementPtr -> "getelementptr"
  | Trunc -> "trunc"
  | ZExt -> "zext"
  | SExt -> "sext"
  | FPToUI -> "fptoui"
  | FPToSI -> "fptosi"
  | UIToFP -> "uitofp"
  | SIToFP -> "sitofp"
  | FPTrunc -> "fptrunc"
  | FPExt -> "fpext"
  | PtrToInt -> "ptrtoint"
  | IntToPtr -> "inttoptr"
  | BitCast -> "bitcast"
  | ICmp -> "icmp"
  | FCmp -> "fcmp"
  | PHI -> "phi"
  | Call -> "call"
  | Select -> "select"
  | UserOp1 -> "userop1"
  | UserOp2 -> "userop2"
  | VAArg -> "vaarg"
  | ExtractElement -> "extractelement"
  | InsertElement -> "insertelement"
  | ShuffleVector -> "shufflevector"
  | ExtractValue -> "extractvalue"
  | InsertValue -> "insertvalue"
  | Fence -> "fence"
  | AtomicCmpXchg -> "atomiccmpxchg"
  | AtomicRMW -> "atomicrmw"
  | Resume -> "resume"
  | LandingPad -> "landingpad"
  | _ -> "other"

let print_val lv =
  Printf.printf "  name %s\n" (value_name lv) ;
  let llty = type_of lv in
  Printf.printf "  type %s\n" (string_of_lltype llty) ;
  print_endline (print_type llty);
  ()

let print_fun lv =
  iter_blocks
    (fun llbb ->
      iter_instrs
        (fun lli ->
          print_val lli;
          Printf.printf "%s\n" (pretty_opcode (instr_opcode lli));
          Printf.printf "%s\n" (string_of_llvalue lli)
        )
        llbb
    )
    lv