#!/usr/bin/env python3
"""
GRC Engineering Labs - Risk Calculator
Automated risk assessment calculations

Maintainer: Aminu Idris, AMCPN
Organization: ICDFA
Version: 1.0.0
"""

import argparse
import sys
from typing import Dict, List, Tuple

# Risk likelihood values
LIKELIHOOD = {
    'rare': 1,
    'unlikely': 2,
    'possible': 3,
    'likely': 4,
    'almost_certain': 5
}

# Risk impact values
IMPACT = {
    'insignificant': 1,
    'minor': 2,
    'moderate': 3,
    'major': 4,
    'catastrophic': 5
}

# Risk matrix
RISK_MATRIX = {
    (1, 1): ('Low', 1), (1, 2): ('Low', 2), (1, 3): ('Medium', 3),
    (1, 4): ('Medium', 4), (1, 5): ('High', 5),
    (2, 1): ('Low', 2), (2, 2): ('Low', 4), (2, 3): ('Medium', 6),
    (2, 4): ('High', 8), (2, 5): ('High', 10),
    (3, 1): ('Medium', 3), (3, 2): ('Medium', 6), (3, 3): ('Medium', 9),
    (3, 4): ('High', 12), (3, 5): ('Critical', 15),
    (4, 1): ('Medium', 4), (4, 2): ('High', 8), (4, 3): ('High', 12),
    (4, 4): ('Critical', 16), (4, 5): ('Critical', 20),
    (5, 1): ('High', 5), (5, 2): ('High', 10), (5, 3): ('Critical', 15),
    (5, 4): ('Critical', 20), (5, 5): ('Critical', 25)
}


def calculate_risk_score(likelihood: str, impact: str) -> Tuple[str, int]:
    """Calculate risk score based on likelihood and impact."""
    l_value = LIKELIHOOD.get(likelihood.lower())
    i_value = IMPACT.get(impact.lower())
    
    if l_value is None or i_value is None:
        raise ValueError("Invalid likelihood or impact value")
    
    return RISK_MATRIX[(l_value, i_value)]


def calculate_ale(sle: float, aro: float) -> float:
    """Calculate Annual Loss Expectancy (ALE)."""
    return sle * aro


def calculate_risk_reduction(ale_before: float, ale_after: float, 
                            control_cost: float) -> Dict[str, float]:
    """Calculate risk reduction metrics."""
    risk_reduction = ale_before - ale_after
    net_benefit = risk_reduction - control_cost
    roi = (net_benefit / control_cost * 100) if control_cost > 0 else 0
    
    return {
        'risk_reduction': risk_reduction,
        'net_benefit': net_benefit,
        'roi_percentage': roi
    }


def print_risk_assessment(risk_name: str, likelihood: str, impact: str):
    """Print risk assessment results."""
    level, score = calculate_risk_score(likelihood, impact)
    
    print(f"\nRisk Assessment: {risk_name}")
    print("=" * 50)
    print(f"Likelihood: {likelihood.title()} ({LIKELIHOOD[likelihood.lower()]})")
    print(f"Impact: {impact.title()} ({IMPACT[impact.lower()]})")
    print(f"Risk Score: {score}")
    print(f"Risk Level: {level}")
    print("=" * 50)


def print_ale_calculation(sle: float, aro: float):
    """Print ALE calculation results."""
    ale = calculate_ale(sle, aro)
    
    print(f"\nAnnual Loss Expectancy (ALE) Calculation")
    print("=" * 50)
    print(f"Single Loss Expectancy (SLE): ${sle:,.2f}")
    print(f"Annual Rate of Occurrence (ARO): {aro}")
    print(f"Annual Loss Expectancy (ALE): ${ale:,.2f}")
    print("=" * 50)


def print_risk_reduction_analysis(ale_before: float, ale_after: float, 
                                 control_cost: float):
    """Print risk reduction analysis."""
    results = calculate_risk_reduction(ale_before, ale_after, control_cost)
    
    print(f"\nRisk Reduction Analysis")
    print("=" * 50)
    print(f"ALE Before Control: ${ale_before:,.2f}")
    print(f"ALE After Control: ${ale_after:,.2f}")
    print(f"Control Cost: ${control_cost:,.2f}")
    print(f"Risk Reduction: ${results['risk_reduction']:,.2f}")
    print(f"Net Benefit: ${results['net_benefit']:,.2f}")
    print(f"ROI: {results['roi_percentage']:.2f}%")
    
    if results['net_benefit'] > 0:
        print("\nRecommendation: Control implementation is cost-effective")
    else:
        print("\nRecommendation: Control cost exceeds benefit")
    print("=" * 50)


def main():
    parser = argparse.ArgumentParser(
        description='GRC Risk Calculator - Automated risk assessment calculations'
    )
    
    subparsers = parser.add_subparsers(dest='command', help='Calculation type')
    
    # Risk score command
    risk_parser = subparsers.add_parser('risk', help='Calculate risk score')
    risk_parser.add_argument('--name', required=True, help='Risk name')
    risk_parser.add_argument('--likelihood', required=True,
                           choices=['rare', 'unlikely', 'possible', 'likely', 'almost_certain'],
                           help='Risk likelihood')
    risk_parser.add_argument('--impact', required=True,
                           choices=['insignificant', 'minor', 'moderate', 'major', 'catastrophic'],
                           help='Risk impact')
    
    # ALE command
    ale_parser = subparsers.add_parser('ale', help='Calculate ALE')
    ale_parser.add_argument('--sle', type=float, required=True,
                          help='Single Loss Expectancy')
    ale_parser.add_argument('--aro', type=float, required=True,
                          help='Annual Rate of Occurrence')
    
    # Risk reduction command
    reduction_parser = subparsers.add_parser('reduction', help='Calculate risk reduction')
    reduction_parser.add_argument('--ale-before', type=float, required=True,
                                help='ALE before control')
    reduction_parser.add_argument('--ale-after', type=float, required=True,
                                help='ALE after control')
    reduction_parser.add_argument('--control-cost', type=float, required=True,
                                help='Cost of control implementation')
    
    args = parser.parse_args()
    
    if args.command == 'risk':
        print_risk_assessment(args.name, args.likelihood, args.impact)
    elif args.command == 'ale':
        print_ale_calculation(args.sle, args.aro)
    elif args.command == 'reduction':
        print_risk_reduction_analysis(args.ale_before, args.ale_after, args.control_cost)
    else:
        parser.print_help()
        sys.exit(1)


if __name__ == '__main__':
    main()
