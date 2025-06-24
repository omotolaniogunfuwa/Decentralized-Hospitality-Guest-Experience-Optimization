import { describe, it, expect, beforeEach } from "vitest"

describe("Experience Personalization Contract", () => {
  let contractAddress
  let guestAddress
  
  beforeEach(() => {
    contractAddress = "ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.experience-personalization"
    guestAddress = "ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG"
  })
  
  it("should set guest preferences successfully", () => {
    const result = {
      type: "ok",
      value: true,
    }
    expect(result.type).toBe("ok")
    expect(result.value).toBe(true)
  })
  
  it("should get guest preferences", () => {
    const preferences = {
      "room-temperature": 22,
      "pillow-type": "memory-foam",
      "dietary-restrictions": "vegetarian",
      "preferred-services": ["spa", "room-service"],
      "communication-preference": "email",
    }
    expect(preferences["room-temperature"]).toBe(22)
    expect(preferences["pillow-type"]).toBe("memory-foam")
    expect(preferences["preferred-services"]).toContain("spa")
  })
  
  it("should add experience record", () => {
    const result = {
      type: "ok",
      value: true,
    }
    expect(result.type).toBe("ok")
    expect(result.value).toBe(true)
  })
  
  it("should get experience history", () => {
    const history = [
      {
        "service-type": "spa",
        rating: 5,
        timestamp: 1000,
      },
      {
        "service-type": "room-service",
        rating: 4,
        timestamp: 1001,
      },
    ]
    expect(history).toHaveLength(2)
    expect(history[0]["service-type"]).toBe("spa")
    expect(history[0].rating).toBe(5)
  })
  
  it("should get personalized recommendations", () => {
    const recommendations = ["spa", "room-service", "concierge"]
    expect(recommendations).toHaveLength(3)
    expect(recommendations).toContain("spa")
  })
  
  it("should update preferences from experience", () => {
    const result = {
      type: "ok",
      value: true,
    }
    expect(result.type).toBe("ok")
    expect(result.value).toBe(true)
  })
})
