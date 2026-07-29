import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean.SimplicialComplex

namespace HautevilleHouse
namespace CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean

structure ShellingPackage (K : SimplicialComplex) where
  ordering : List (List (K.vertices))
  shellingCondition : Prop
  pure : Prop

structure ShellingEvidence {K : SimplicialComplex} (S : ShellingPackage K) where
  orderingFormsShelling : S.shellingCondition
  pureClosed : S.pure

def ShellingClosed {K : SimplicialComplex} (S : ShellingPackage K) : Prop :=
  S.shellingCondition ∧ S.pure

theorem shelling_closed_from_evidence {K : SimplicialComplex} (S : ShellingPackage K) (E : ShellingEvidence S) : ShellingClosed S := by
  exact And.intro E.orderingFormsShelling E.pureClosed

end CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean
end HautevilleHouse