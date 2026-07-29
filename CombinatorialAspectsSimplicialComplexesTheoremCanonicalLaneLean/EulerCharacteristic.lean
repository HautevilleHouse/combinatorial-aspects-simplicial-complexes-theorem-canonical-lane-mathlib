import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean.SimplicialComplexStructure

namespace HautevilleHouse
namespace CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean

structure EulerCharacteristicPackage (S : SimplicialComplexPackage) where
  fVector : List ℕ
  eulerCharacteristic : ℤ
  eulerComputed : Prop
  eulerPoincareFormula : Prop

structure EulerCharacteristicEvidence {S : SimplicialComplexPackage}
    (E : EulerCharacteristicPackage S) where
  eulerComputedClosed : E.eulerComputed
  eulerPoincareFormulaClosed : E.eulerPoincareFormula

def EulerCharacteristicClosed {S : SimplicialComplexPackage}
    (E : EulerCharacteristicPackage S) : Prop :=
  E.eulerComputed ∧ E.eulerPoincareFormula

theorem euler_characteristic_closed_from_evidence {S : SimplicialComplexPackage}
    (E : EulerCharacteristicPackage S) (Ev : EulerCharacteristicEvidence E) :
    EulerCharacteristicClosed E := by
  exact And.intro Ev.eulerComputedClosed Ev.eulerPoincareFormulaClosed

end CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean
end HautevilleHouse
