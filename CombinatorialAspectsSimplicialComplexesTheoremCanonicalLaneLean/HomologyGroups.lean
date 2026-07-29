import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean.SimplicialComplexStructure

namespace HautevilleHouse
namespace CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean

structure HomologyPackage (S : SimplicialComplexPackage) where
  chainGroups : Type u
  boundaryMaps : Type v
  homologyGroups : Type w
  homologyComputed : Prop

structure HomologyEvidence {S : SimplicialComplexPackage} (H : HomologyPackage S) where
  homologyComputedClosed : H.homologyComputed

def HomologyClosed {S : SimplicialComplexPackage} (H : HomologyPackage S) : Prop :=
  H.homologyComputed

theorem homology_closed_from_evidence {S : SimplicialComplexPackage}
    (H : HomologyPackage S) (E : HomologyEvidence H) : HomologyClosed H := by
  exact E.homologyComputedClosed

end CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean
end HautevilleHouse
