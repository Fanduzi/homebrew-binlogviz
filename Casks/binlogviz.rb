cask "binlogviz" do
  version "0.11.0"

  on_macos do
    on_intel do
      sha256 "8c8a5c9d8ac948385cce115307e883c0bb50db133951f4560654ebf26a474372"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.11.0/binlogviz_0.11.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "13f3e43549545bf16fbeef48a33ce97554d387a2e6aefe67e62c6ca6e8f2f7c0"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.11.0/binlogviz_0.11.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "dbd990d8ef3d443539179375de86591e7e720f6c50494cfcda4381a53b109b27"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.11.0/binlogviz_0.11.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "4b84fe5f15b14f3f8ed15de16117c124bd6a17333d6456deba4c1c3f957e4344"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.11.0/binlogviz_0.11.0_linux_arm64.tar.gz",
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
