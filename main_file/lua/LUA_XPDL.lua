-- Code by GLide KS

function A_Explode2(actor, var1, var2)
    for p in players.iterate do
        if (p.mo and p.mo.valid and p.mo.health)
        and (p.powers[pw_flashing] < 1) then
            local radius = R_PointToDist2(p.mo.x, p.mo.y, actor.x, actor.y)
            local instakill = (abs(radius) <= (p.mo.radius*24))

            if P_CheckSight(actor, p.mo) then
                --Unsuper the players
                if p.powers[pw_super] then
                    p.powers[pw_super] = 0
                    p.mo.color = p.skincolor
                end

                --Damage the player
                P_DamageMobj(p.mo)

                --Direct hits insta kills
                if instakill then
                    P_KillMobj(p.mo)
                end
            end
        end
    end
end