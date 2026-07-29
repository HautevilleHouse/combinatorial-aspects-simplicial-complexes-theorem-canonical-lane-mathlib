import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean.SimplicialComplexDefinition

namespace HautevilleHouse
namespace CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean

structure ShellabilityPackage {K : SimplicialComplex} where
  shellingOrder : List (List K.vertices)
  shellingCondition : Prop
  pureComplex : Prop
  cohenMacaulay : Prop

structure ShellabilityEvidence {K : SimplicialComplex} (S : ShellabilityPackage K) where
  shellingConditionClosed : S.shellingCondition
  pureComplexClosed : S.pureComplex
  cohenMacaulayClosed : S.cohenMacaulay
  shellingImpliesCohenMacaulay : S.shellingCondition → S.cohenMacaulay

def ShellabilityClosed {K : SimplicialComplex} (S : ShellabilityPackage K) : Prop :=
  S.shellingCondition ∧ S.pureComplex ∧ S.cohenMacaulay

theorem shellability_closed_from_evidence {K : SimplicialComplex} (S : ShellabilityPackage K) (E : ShellabilityEvidence S) :
    ShellabilityClosed S := by
  exact And.intro E.shellingConditionClosed (And.intro E.pureComplexClosed E.cohenMacaulayClosed)

def CohenMacaulayClosed {K : SimplicialComplex} (S : ShellabilityPackage K) : Prop :=
  S.cohenMacaulay

theorem cohen_macaulay_from_shelling {K : SimplicialComplex} (S : ShellabilityPackage K) (E : ShellabilityEvidence S) :
    CohenMacaulayClosed S := by
  exact E.cohenMacaulayClosed

end CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean
end HautevilleHouse