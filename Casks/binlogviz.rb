cask "binlogviz" do
  version "0.23.15"

  on_macos do
    on_intel do
      sha256 "0e8d6d4aed064645e5d9806a1033783156f6d29bfbb020fbcd34187d0979fe98"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.15/binlogviz_0.23.15_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "570fb45eff049270500f49587bd96535231fd6a186e8abfc0d783fc2efd30f97"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.15/binlogviz_0.23.15_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "f3039c3e43390c40016ccf16e483c72eb944836088e6df8d12da44f9f051646f"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.15/binlogviz_0.23.15_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "2b12024dfbe1bba56a8cd05b5a816549eebd7581b3cbaae514959799521b0039"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.15/binlogviz_0.23.15_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end
