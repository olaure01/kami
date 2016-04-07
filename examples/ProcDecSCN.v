Require Import Bool String List.
Require Import Lib.CommonTactics Lib.ilist Lib.Word.
Require Import Lib.Struct Lib.StringBound Lib.FMap Lib.StringEq.
Require Import Lts.Syntax Lts.Semantics Lts.Equiv Lts.Refinement Lts.Renaming Lts.Wf.
Require Import Lts.Renaming Lts.Specialize.
Require Import Ex.SC Ex.Fifo Ex.MemAtomic.
Require Import Ex.ProcDec Ex.ProcDecInl Ex.ProcDecInv Ex.ProcDecSC.

Set Implicit Arguments.

Section ProcDecSCN.
  Variables addrSize fifoSize valSize rfIdx: nat.

  Variable dec: DecT 2 addrSize valSize rfIdx.
  Variable exec: ExecT 2 addrSize valSize rfIdx.
  Hypotheses (HdecEquiv: DecEquiv dec)
             (HexecEquiv_1: ExecEquiv_1 dec exec)
             (HexecEquiv_2: ExecEquiv_2 dec exec).

  Variable n: nat.

  Definition pdecN := procDecM fifoSize dec exec n.
  Definition scN := sc dec exec opLd opSt opHt n.

  Lemma pdecN_refines_scN: traceRefines (liftToMap1 (@idElementwise _)) pdecN scN.
  Proof.
    apply traceRefines_modular_interacting with (vp:= (@idElementwise _)); auto.
    - admit.
    - admit.
    - admit. 
    - admit.
    - admit.
    - admit.
    - admit.
    - admit.
    - apply duplicate_defCallSub.
      vm_compute; split; intros; intuition idtac.
    - apply DefCallSub_refl.
    - repeat split.
    - (* TODO: a general lemma for duplication-refinement: implement in Specialize.v *)
      induction n; simpl; intros.
      + apply specialized_2.
        * intros; vm_compute.
          (* intro; dest. *)
          (* repeat *)
          (*   match goal with *)
          (*   | [H: _ \/ _ |- _] => destruct H *)
          (*   end; subst; try discriminate; auto. *)
          (* TODO: takes a time ... *)
          admit.
        * intros; vm_compute; admit.
        * apply traceRefines_label_map with (p:= liftToMap1 (@idElementwise _)); auto.
          { admit. }
          { admit. (* apply pdec_refines_pinst. *) }
      + admit. (* apply traceRefines_modular_noninteracting. *)
    - rewrite idElementwiseId; apply traceRefines_refl.
  Qed.

End ProcDecSCN.

